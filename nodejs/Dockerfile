FROM alpine:latest
RUN apk update \ 
    && apk add nodejs-npm \
    && mkdir /webapp \
    && npm install express \
    && npm install mysql

COPY ./server.js /webapp
WORKDIR /webapp
CMD ["node", "server.js"]
EXPOSE 8080
