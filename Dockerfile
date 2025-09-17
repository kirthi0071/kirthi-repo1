# Base Node.js image
FROM node:18-slim

# Install NGINX
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy apps
WORKDIR /usr/src/app
COPY app1 ./app1
COPY app2 ./app2

# Install dependencies
WORKDIR /usr/src/app/app1
RUN npm install express

WORKDIR /usr/src/app/app2
RUN npm install express

# Copy NGINX config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Start all processes: app1, app2, nginx
CMD node /usr/src/app/app1/server.js & \
    node /usr/src/app/app2/server.js & \
    nginx -g 'daemon off;'

# Cloud Run will expose port 8080
EXPOSE 8080
