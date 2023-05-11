#FROM tomcat:8.0.20-jre8
#COPY target/*.war /usr/local/tomcat/webapps/maven-web-app.war

FROM alpine:latest

RUN apk add --no-cache nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
