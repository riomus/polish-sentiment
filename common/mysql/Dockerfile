FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server-5.6 p7zip-full && \
  rm -rf /var/lib/apt/lists/*

RUN rm -rf /var/lib/mysql/*

ENV DUMP_DATA_NAME ''
ENV MYSQL_ROOT_PASSWORD ''
ENV DB_USER ''
ENV DB_USER_PASSWORD ''
ENV DB_NAME ''

ADD assets/my.cnf /etc/mysql/conf.d/my.cnf

EXPOSE 3306
ADD assets/run.sh /


ENTRYPOINT  /bin/bash /run.sh $DUMP_DATA_NAME /opt/wordnet $MYSQL_ROOT_PASSWORD $DB_USER $DB_USER_PASSWORD $DB_NAME












