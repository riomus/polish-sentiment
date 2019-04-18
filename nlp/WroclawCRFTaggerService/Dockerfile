FROM polish-sentiment_riomus_wcrft2

RUN apt-get update  && \
	apt-get install -yq  software-properties-common && \
	add-apt-repository -y ppa:webupd8team/java  && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&\
	echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections &&\
	apt-get update  &&\
	apt-get install -yq oracle-java8-installer maven rpm alien && \
 	rm -rf /var/lib/apt/lists/*

COPY assets/wcrft2-java-wrapper-rpm-1.0-SNAPSHOT20141214143930.amd64.rpm /tmp/wcrft2/wcrft2-java-wrapper.rpm
COPY assets/wcrft2-service-1.0-SNAPSHOT.jar /tmp/wcrft2/wcrft2-service-1.0-SNAPSHOT.jar

RUN cd /tmp/wcrft2 &&  alien -i --scripts wcrft2-java-wrapper.rpm

RUN locale-gen pl_PL.UTF-8  
ENV LANG pl_PL.UTF-8  
ENV LANGUAGE pl_PL:pl  
ENV LC_ALL pl_PL.UTF-8  

ENTRYPOINT  java -jar /tmp/wcrft2/wcrft2-service-1.0-SNAPSHOT.jar 
