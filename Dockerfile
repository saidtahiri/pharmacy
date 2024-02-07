# Stage 1: Build the Angular app
FROM node:18.18.0 as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


# Stage 2: Create a minimal, production-ready image
FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

