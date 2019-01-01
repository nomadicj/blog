#!/usr/bin/env sh

aws s3 sync s3://config.nomadicj/$DOMAIN/cert/ ./

tar -C /etc/letsencrypt -xvf certbundle.tar

certbot renew

if [ $? -eq 0 ]
then
  certbot certonly -n --agree-tos --email admin@$DOMAIN --dns-route53 -d $DOMAIN
fi

tar -C /etc/letsencrypt/ -cvf certbundle.tar ./

aws s3 cp certbundle.tar s3://config.nomadicj/$DOMAIN/cert/

aws iam upload-server-certificate --path /cloudfront/ \
--server-certificate-name $DOMAIN-$CIRCLE_BUILD_NUM \
--certificate-body file:///etc/letsencrypt/live/$DOMAIN/cert.pem \
--certificate-chain file:///etc/letsencrypt/live/$DOMAIN/chain.pem \
--private-key file:///etc/letsencrypt/live/$DOMAIN/privkey.pem
