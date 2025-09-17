# Base Node.js image
FROM node:18-slim

# Install NGINX
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy apps
WORKDIR /usr/src/app
COPY app1 ./app1
COPY app2 ./app2

# Install dependencies for app1
WORKDIR /usr/src/app/app1
RUN npm install

# Install dependencies for app2
WORKDIR /usr/src/app/app2
RUN npm install

# Copy NGINX config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose Cloud Run port
EXPOSE 8080

# Start app1 (5001), app2 (5002), then Nginx (8080)
CMD node /usr/src/app/app1/server.js & \
    node /usr/src/app/app2/server.js & \
    nginx -g 'daemon off;'
