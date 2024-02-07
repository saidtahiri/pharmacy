#Utilise l'image officielle Node.js comme étape de Build, et la nomme "build".
#Cela signifie que les instructions suivantes s appliqueront à cette étape de build du projet.
FROM node:18.18.0 as build

#Définit le répertoire de travail à /app. Tous les Builds futur seront exécutées dans ce répertoire.
WORKDIR /app

#Copie tous les fichiers et répertoires du contexte de build    
#(le répertoire local où se trouve le Dockerfile) dans le répertoire de travail (/app).
COPY . .

#Exécute la commande npm install pour installer les dépendances Node.js du projet.
RUN npm install

RUN npm run build

#Utilise l'image officielle Nginx.
FROM nginx:alpine

#Copie les fichiers générés lors de l'étape de build vers le répertoire où Nginx servira les fichiers statiques 
COPY --from=build /app/dist/ /usr/share/nginx/html

#Indique que le conteneur écoutera sur le port 80.
EXPOSE 80

#Définit la commande par défaut à exécuter lorsque le conteneur démarre. 
#Dans ce cas, cela exécute Nginx en mode démon (daemon off;).
# Cela permet au conteneur de rester actif et de gérer les requêtes HTTP.
CMD ["nginx", "-g", "daemon off;"]

