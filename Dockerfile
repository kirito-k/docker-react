FROM node:alpine as preinstall
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=preinstall /app/build /usr/share/nginx/html


