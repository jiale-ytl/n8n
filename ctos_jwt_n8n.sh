#!/bin/bash 
CLIENT_ID=Ryt2_jwt
PRIVATE_KEY=/home/node/.ssh/rsa-private.pem
TOKEN_EXPIRY=3000 

NOW=`date '+%s'` 
EXPIRY=`expr ${NOW} + ${TOKEN_EXPIRY}` 
TOKEN_ID=`echo -n tkn_`${NOW} 

HEADER=`echo -n '{"alg":"RS256","typ":"JWT"}' | base64` 
PAYLOAD=`echo -n "{\"jti\":\"${TOKEN_ID}\",\"sub\":\"${CLIENT_ID}\",\"iss\":\"${CLIENT_ID}\",\"aud\":\"https://uat-sso.ctos.com.my/auth/realms/CTOSNET/protocol/openid-connect/token\",\"exp\":${EXPIRY},\"iat\":${NOW}}" | base64` 

SIGNATURE=`echo -n "${HEADER}.${PAYLOAD}" | openssl dgst -sha256 -binary -sign ${PRIVATE_KEY} | openssl enc -base64 | tr -d '\n=' | tr -- '+/' '-_'` 
echo "${HEADER}.${PAYLOAD}.${SIGNATURE}"