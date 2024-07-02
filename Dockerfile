FROM openjdk:8u212-jre-alpine3.9
MAINTAINER Sean

EXPOSE 8080
WORKDIR /app
VOLUME /app/data/

COPY ./app /app

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    chmod +x /app/start.sh

CMD ["/app/start.sh"]