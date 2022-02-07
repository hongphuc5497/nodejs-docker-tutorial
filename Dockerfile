# syntax=docker/dockerfile:1
FROM node:16-alpine AS base

WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]

FROM base AS test
COPY . .
RUN yarn install
CMD ["yarn", "test"]

FROM base AS production
COPY . .
RUN yarn install --production
CMD ["node", "server.js"]
