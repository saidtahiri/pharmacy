# Use an official Node.js runtime as a base image
FROM node:18.18.0 AS builder


# Install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install -g npm@latest
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Angular application
RUN npm install -g @angular/cli@17.0.6 && npm install
RUN npm run build --prod

# Use a lightweight Nginx image as the final base image
FROM nginx:alpine

# Copy the built Angular artifacts to the Nginx web root directory
COPY --from=builder /app/dist/app-frontend /usr/share/nginx/html

# Expose port 80 for incoming traffic
EXPOSE 80

# Start Nginx to serve the Angular application
CMD ["nginx", "-g", "daemon off;"]
