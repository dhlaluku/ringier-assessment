FROM node:22 AS build
WORKDIR /app

RUN wget https://rimu-tf-base-playground.s3-eu-west-1.amazonaws.com/dockerise/dockerise_me.zip && \
    unzip dockerise_me.zip && \
    rm -rf dockerise_me.zip


FROM node:22-slim
WORKDIR /app
RUN apt-get update && apt-get install -y \
    ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /app /app/
RUN npm init --yes
RUN --mount=type=cache,target=/app/node_modules npm install --prefer-offline

EXPOSE 8080

ENV FOOBAR test

CMD [ "node",  "main.js" ]