# Use the official Nginx image from the Docker Hub
FROM nginx:1.27.3

RUN apt-get update && apt-get install -y nano curl && rm -rf /var/lib/apt/lists/*

COPY ./.dockerdev/nginx/ /etc/nginx/
COPY ./public/favicon.ico /var/www/html/favicon.ico
 
