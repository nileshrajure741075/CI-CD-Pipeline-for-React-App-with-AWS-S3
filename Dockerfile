# Step 1: Build the React app
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire source code and build it
COPY . .
RUN npm run build

# Step 2: Serve the React app using Nginx
FROM nginx:alpine

# Copy built React files from builder to nginx's public folder
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to access app
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
