# Spring Bootアプリケーションのビルドを行います。

FROM openjdk:17-slim AS server-build
WORKDIR /app
COPY . .

RUN ["sh", "./gradlew", "build"]

# Spring BootアプリケーションとMySQLを起動します。

FROM ubuntu:22.04

ENV PORT=8080

COPY --from=server-build /app/build/libs/demo-0.0.1-SNAPSHOT.jar /usr/src
COPY ./init.sql /usr/src

RUN apt-get update
RUN apt-get install -y openjdk-17-jre-headless
RUN apt-get install -y mysql-server

RUN rm -rf /var/lib/mysql/*
COPY ./my.cnf /etc/mysql/my.cnf
RUN mysqld --initialize-insecure --user=mysql
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./startup.sh /startup.sh
RUN chmod 755 /startup.sh
CMD /startup.sh