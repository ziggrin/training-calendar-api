FROM nginx:1.27.3

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        nano && \
    rm -rf /var/lib/apt/lists/*

# Copy config
COPY nginx/ /etc/nginx/

COPY ./public/favicon.ico /var/www/html/favicon.ico

# Test config
RUN nginx -t