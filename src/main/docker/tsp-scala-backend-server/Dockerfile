FROM java:8
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN mkdir /var/log/tsp-scala-backend-server

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 8080
ADD /maven/tsp-scala-backend-server*.jar /
RUN chmod +x /tsp-scala-backend-server*.jar
CMD java $JAVA_OPTS -jar /tsp-scala-backend-server*.jar


#ENV TZ="GB"
#CMD export ENV="GB"; java $JAVA_OPTS -jar /tsp-scala-backend-server*.jar
