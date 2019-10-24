FROM node:alpine as preinstall
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=preinstall /app/build /usr/share/nginx/html


