FROM node:lts-alpine as build-stage

ARG REACT_APP_BACKEND_URL

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn

COPY . .

EXPOSE 3000

ENTRYPOINT yarn start