## Build n8n docker image
```
docker build -t n8n_docker_with_openssl .
```

## Start n8n
```
docker run -it --rm --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n -v rsa-private.pem:/home/node/.ssh/rsa-private.pem:ro -v ctos_jwt_n8n.sh:/home/node/scripts/generate-jwt.sh:ro n8n_docker_with_openssl
```