FROM riomus/jarexecutor

RUN apt-get update   && \
	apt-get install -yq  libblas* wget locales &&\
 	 rm -rf /var/lib/apt/lists/*
RUN mkdir -p /sentimentAnalyzers/
RUN wget https://github.com/riomus/polish-sentiment/blob/master/nlp/SentimentAnalyzers/assets/sentiment-analyzers-service-1.0-SNAPSHOT.jar?raw=true -O /sentimentAnalyzers/service.jar

ENV JAR_LOCATION   /sentimentAnalyzers/service.jar 

RUN locale-gen pl_PL.UTF-8  
ENV LANG pl_PL.UTF-8  
ENV LANGUAGE pl_PL:pl  
ENV LC_ALL pl_PL.UTF-8  

ENTRYPOINT  /usr/bin/java -jar $JAR_LOCATION
