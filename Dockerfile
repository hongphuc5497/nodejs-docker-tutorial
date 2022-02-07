# syntax=docker/dockerfile:1
FROM node:16-alpine AS base

WORKDIR /app

COPY package.json package.json
COPY yarn.lock yarn.lock

FROM base AS test
RUN yarn install
COPY . .
RUN yarn test

FROM base AS production
RUN yarn install --production
COPY . .
CMD ["node", "server.js"]
