# FROM node:lts-alpine as build-stage

# WORKDIR /app

# COPY ./app/package.json .

# RUN npm install

# build stage
# FROM node:lts-alpine as build-stage
# WORKDIR /app
# COPY ./app/package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# production stage
# FROM nginx:stable-alpine as production-stage
# COPY --from=build-stage app/dist /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

FROM node:16.3.0-alpine
WORKDIR /app
COPY ./app/package.json .
RUN  npm install
EXPOSE 8080
CMD ["npm", "run", "serve"]