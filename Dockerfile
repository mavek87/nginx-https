FROM nginx:latest
COPY ./certs/prova.crt /etc/nginx/certs/prova.crt
COPY ./certs/prova.key /etc/nginx/certs/prova.key
COPY nginx.conf /etc/nginx/conf.d/default.conf
