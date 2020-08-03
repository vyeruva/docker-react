FROM node:alpine as builder
WORKDIR '/home/service'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/service/build /usr/share/nginx/html