FROM openjdk:8
EXPOSE 8080
ADD target/git-docker-k8spipeline221223.jar git-docker-k8spipeline221223.jar
ENTRYPOINT ["java","-jar","/git-docker-k8spipeline221223.jar"]
