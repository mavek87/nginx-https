
https://stackoverflow.com/questions/63195304/difference-between-pem-crt-key-files#:~:text=be%20kept%20secret.-,.,decrypt%20data%20sent%20by%20servers.

https://www.misterpki.com/openssl-genpkey/

https://www.youtube.com/watch?v=xNk8fZCuCMU - procedimento completo

https://faun.pub/setting-up-ssl-certificates-for-nginx-in-docker-environ-e7eec5ebb418

https://ssl-config.mozilla.org/#server=nginx&version=1.23.4&config=intermediate&openssl=1.1.1q&guideline=5.6





1) Generate a RSA private key:

```openssl genpkey -algorithm RSA -out prova.key```

if you want to encrypt the private key you can enter for example:

```openssl genpkey -algorithm RSA -out key.pem -aes-256-cbc```

in this second case the private key will be encrypted with a password

2) Create a Certificate Signing Request:

```openssl req -new -key prova.key -out prova.csr```

Some metadata will be requested after this command. If the requested password is not being set, the procedure will be simpler.
After that all the csr file content should be sent to a certificate authority (in production) or self-signed (for dev/test environment)

3) To self-sing the csr:

```openssl x509 -req -in prova.csr -sign-key prova.key -out prova.crt```



With both the prova.key and prova.crt is now possible to set TLS in nginx.


1) A nginx conf file (default.conf) for HTTPS.
2) The Dockerfile used to build a nginx container with inside the default.conf and the two files previously created (key and crt)
3) A docker-compose.yml file to facilitate the creation of the nginx container. Run it using: ```docker compose up -d --build```







