FROM node:alpine
WORKDIR '/home/service'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /home/service/build /usr/share/nginx/html