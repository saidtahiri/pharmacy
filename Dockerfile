# Use an official Node.js runtime as a base image
FROM node:14 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for backend
COPY backend/package*.json ./backend/

# Install backend dependencies
RUN cd backend && npm install

# Copy package.json and package-lock.json for frontend
COPY frontend/package*.json ./frontend/

# Install frontend dependencies
RUN cd app-frontend && npm install

# Copy the entire project to the working directory
COPY . .

# Build the Angular application
RUN cd app-frontend && npm run build --prod

# Expose the port on which the Node.js application will run
EXPOSE 3000

# Command to start the Node.js application
CMD ["node", "backend/app.js"]
