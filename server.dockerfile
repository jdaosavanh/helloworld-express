FROM node:lts as build

WORKDIR /build

COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn/ .yarn/
COPY apps/express/package.json /build/apps/express/

RUN corepack enable && \
    yarn install

COPY . .

WORKDIR /build/apps/express

CMD ["node", "src/server.js"]
