FROM node:12

ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USERNAME
ARG DB_PASSWORD

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn

COPY . .

EXPOSE 1337

ENTRYPOINT yarn develop

# RUN mkdir app
# COPY . /app
# WORKDIR /app

# RUN echo "unsafe-perm = true" >> ~/.npmrc

# RUN npm install -g strapi@beta

# RUN npm install

# RUN npm install mysql --save

# EXPOSE 1337

# ENTRYPOINT yarn develop