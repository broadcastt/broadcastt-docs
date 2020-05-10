FROM alpine:latest

COPY . /app
WORKDIR /app
RUN apk add --no-cache hugo && \
    hugo

##

FROM nginx:alpine

COPY . .
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=0 /app/public /usr/share/nginx/html
