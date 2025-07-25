# Use an official Nginx image
FROM nginx:alpine

COPY package*.json ./

# Copy your HTML file to the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
