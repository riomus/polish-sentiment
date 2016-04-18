FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update   && \
	apt-get install -yq  software-properties-common && \
	add-apt-repository -y ppa:webupd8team/java  && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&\
	echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections &&\
	apt-get update   &&\
	apt-get install -yq oracle-java8-installer maven && \
 	 rm -rf /var/lib/apt/lists/*

ENV FLAGS  ''
ENV JAR_LOCATION  '' 

ENTRYPOINT  /usr/bin/java -jar $FLAGS $JAR_LOCATION