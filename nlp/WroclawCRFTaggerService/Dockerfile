FROM riomus/wroclawcrftagger

RUN apt-get update && apt-get install -yq software-properties-common
RUN add-apt-repository ppa:jonathonf/openjdk -y && apt-get update &&\
	apt-get install -yq openjdk-8-jdk maven rpm alien wget && \
 	rm -rf /var/lib/apt/lists/*
RUN update-alternatives  --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
RUN mkdir -p /tmp/wcrft2

RUN wget https://github.com/riomus/polish-sentiment/blob/master/nlp/WroclawCRFTaggerService/assets/wcrft2-java-wrapper-rpm-1.0-SNAPSHOT20141214143930.amd64.rpm?raw=true -O /tmp/wcrft2/wcrft2-java-wrapper.rpm
RUN wget https://github.com/riomus/polish-sentiment/blob/master/nlp/WroclawCRFTaggerService/assets/wcrft2-service-1.0-SNAPSHOT.jar?raw=true -O /tmp/wcrft2/wcrft2-service-1.0-SNAPSHOT.jar

RUN cd /tmp/wcrft2 &&  alien -i --scripts wcrft2-java-wrapper.rpm

RUN locale-gen pl_PL.UTF-8  
ENV LANG pl_PL.UTF-8  
ENV LANGUAGE pl_PL:pl  
ENV LC_ALL pl_PL.UTF-8  

ENTRYPOINT  java -jar /tmp/wcrft2/wcrft2-service-1.0-SNAPSHOT.jar 
