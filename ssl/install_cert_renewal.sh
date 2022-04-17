#!/bin/sh

while getopts user:domain:services: flag
do
    case "${flag}" in
        user)       TARGET_USER=$OPTARG;;
        domain)     DOMAIN=$OPTARG;;
        services)   SERVICES+=("$OPTARG");;
    esac
done
shift $((OPTIND -1))

cd
mkdir .ssl

sudo tee /etc/letsencrypt/renew-hooks/deploy/apply_new_certs.sh > /dev/null <<EOF
CERTS_DIR="/etc/letsencrypt/live/$DOMAIN"
NEW_CERTS_DIR="/home/$TARGET_USER/.ssl"
USER_GROUP="$(id -ng $TARGET_USER)"

cp "$CERTS_DIR/fullchain.pem" "$NEW_CERTS_DIR/server_cert.pem"
cp "$CERTS_DIR/privkey.pem" "$NEW_CERTS_DIR/server_key.pem"
chown $TARGET_USER:$USER_GROUP "$NEW_CERTS_DIR/server_cert.pem"
chown $TARGET_USER:$USER_GROUP "$NEW_CERTS_DIR/server_key.pem"

for service in "${SERVICES[@]}"; do
    sudo systemctl restart $service
    sleep 5
done
EOF

chmod +x /etc/letsencrypt/renewal-hooks/deploy/apply_new_certs.sh
chmod 750 /etc/letsencrypt/renewal-hooks/deploy/apply_new_certs.sh
