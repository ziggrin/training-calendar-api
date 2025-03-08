FROM nginx:1.27.3

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        nano && \
    rm -rf /var/lib/apt/lists/*

# Remove default content
RUN rm -rf /usr/share/nginx/html/*

# Copy config
COPY nginx/ /etc/nginx/

COPY ./public/favicon.ico /var/www/html/favicon.ico

# # Test config - commented out cause in EC2 we're using linking (http://app:3000)
# RUN nginx -t