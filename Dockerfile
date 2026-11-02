FROM nginx:alpine
LABEL org.opencontainers.image.title="my-first-web"
COPY site/ /usr/share/nginx/html/
EXPOSE 80
