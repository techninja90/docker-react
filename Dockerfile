#Use an existing docker image as base

FROM node:alpine as  builder

WORKDIR '/app'

#Install Some dependencies

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
