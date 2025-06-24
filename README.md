## Build n8n docker image
```
docker build -t n8n_docker_with_openssl .
```

## Start n8n
```
docker run -it --rm --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n -v rsa-private.pem:/home/node/.ssh/rsa-private.pem:ro -v ./script/ctos_jwt_n8n.sh:/home/node/scripts/generate-jwt.sh:ro n8n_docker_with_openssl
```

## Import workflow
 1. import all the workflow json files in workflow dir to n8n
 2. execute 0-get-ctos-report workflow
 3. trigger the workflow by firing using the sample `curl-0-get-ctos-report.txt`
 4. decode the base64 encoded report in `<return>report</return>`
 5. execute 1-credit-decision workflow
 6. trigger the workflow by firing using the sample `curl-1-credit-decision.txt`
 7. you will get the credit decision result