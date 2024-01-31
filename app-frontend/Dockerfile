# Use an official Node.js runtime as a base image
FROM node:14 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Angular application
RUN npm run build --prod

# Use a lightweight Nginx image as the final base image
FROM nginx:alpine

# Copy the built Angular artifacts to the Nginx web root directory
COPY --from=builder /app/dist/app-frontend /usr/share/nginx/html

# Expose port 80 for incoming traffic
EXPOSE 80

# Start Nginx to serve the Angular application
CMD ["nginx", "-g", "daemon off;"]
