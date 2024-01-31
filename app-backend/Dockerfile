# Use an official Node.js runtime as a base image
FROM node:18 AS builder
# Install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm
# Set the working directory
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install project dependencies
RUN npm install -g npm@latest
RUN npm install
# Copy the entire backend project to the working directory
COPY . .
# Expose the port on which the Node.js application will run
EXPOSE 3000
# Command to start the Node.js application
CMD ["node", "app.js"]
