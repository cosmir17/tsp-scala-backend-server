=> Docker Developement Environment for Integration Test & CI/CD.
You can either run your integration tests (with spawning/destroying docker containers automatically) manually from Intellij or by one command on terminal.

Travelling Salesman Problem, Scala backend server.
This is to find the shortest(optimum, heuristics) Hamiltonian path.

WORK IN PROGRESS

Technologies : Scala 2.12, Akka, Akka Http, Protobuf, Kafka, Slick, postgres, Docker fabric8 plugin, functional and unit test automated, Gatling(NFT), ELK, Graphite and Grafana

Maven script(pom.xml) can spawn up docker containers necessary for this application development without Vagrant and you can run your functional tests from Intellij.
Also, since they are Docker containers, you can debug and connect them as you do with EC2 instances.

It's using Maven(running, ft, nft) so it can be used in a script for Jenkin's pipeline.

Docker application may not run on linux. Please refer to the following site.
https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
can be useful when things not working after installing docker.

1. Please run 'sudo sysctl -w vm.max_map_count=262144' on your host machine before running this program. (this is for elk)
2. mvn clean package docker:run //this runs junit tests
3. run feature files on Intellij or, mvn verify -p integration-test [not ready yet]
4. kibana, showing elk is working. provide index pattern.
5. show graphite
6. grafana-datastore
7. import carbon
8. import the grafana dashbard
9. run nft, go to nft/ folder and run 'mvn clean gatling:execute'
10. go to nft/target/~~~~~/index.html open it on browser, you can see nft reports.

'mvn clean package docker:run' will run the following apps together.

backend app(log4j2 async, rolling file) : 8080 /debug port 8008
kafka : 9092
Grafana : 80(web)
Graphite : 81(web) & 2003(data)
logstash : 5044
Kibana : 5601
postgres : 7000

tsp backend server   app(8080) -> ft       -> el       -> kibana
                               -> graphite -> grafana

gatling test(mvn clean gatling:execute) -> products index file
                                        -> graphite -> grafana

to run as a jar file (postgres instance needs to run)
java
-Xdebug
-DLog4jContextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector
-Dlogfolderpath=logfile
-Dconfig.graphite.url=172.17.0.6
-Xrunjdwp:transport=dt_socket,address=5004,server=y,suspend=n
-jar NAME_OF_THE_FILE

To run integration tests on Command (as well as running the containers)
mvn package  [not ready yet]
