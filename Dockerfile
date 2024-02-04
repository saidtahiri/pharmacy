# Use an official Node.js runtime as a base image
FROM node:18.18.0 AS builder

# Set the working directory
WORKDIR /app
# Copy package.json and package-lock.json for backend
COPY package*.json ./app-backend/
# Install backend dependencies
RUN cd app-backend && npm install -g npm@latest
# Copy package.json and package-lock.json for frontend
COPY package*.json ./app-frontend/
# Install frontend dependencies for the frontend
RUN cd app-frontend && npm install -g @angular/cli@17.0.6 && npm install
# Copy the entire project to the working directory
COPY . .
# Build the Angular appwlication
RUN cd app-frontend && \
    npm install  @angular/cli@17.0.6 && \
    npm run build --prod
# Expose the port on which the Node.js application will run
EXPOSE 3000
# Command to start the Node.js application
CMD ["node", "backend-app/app.js"]
