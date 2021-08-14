FROM node:16.6.2 AS development
RUN npm install -g @vue/cli

ARG UID
ARG GID

ENV UID ${UID}
ENV GID ${GID}

RUN usermod -u ${UID} -g ${GID} node

USER node
WORKDIR /var/app/front
COPY --chown=node:node package*.json .
RUN npm install
CMD tail -f /dev/null

FROM development AS build
COPY --chown=node:node . .
RUN npm run build

FROM nginx:1.21.1 as production
RUN mkdir /app
COPY --from=build /var/app/front/dist /app
COPY nginx.conf /etc/nginx/nginx.conf