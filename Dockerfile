# Use official Nginx image
FROM nginx:alpine

# Copy your static site files to Nginx's web directory
COPY index.html /usr/share/nginx/html/

# Optional: expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
