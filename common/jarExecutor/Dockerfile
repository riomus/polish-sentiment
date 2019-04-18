FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  &&\
	apt-get install -yq default-jre maven rpm alien && \
 	rm -rf /var/lib/apt/lists/*


ENV FLAGS  ''
ENV JAR_LOCATION  '' 

ENTRYPOINT  /usr/bin/java -jar $FLAGS $JAR_LOCATION