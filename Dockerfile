FROM openjdk:11
ADD target/*.jar *.jar
ENTRYPOINT ["java","-jar","/*.jar"]
EXPOSE 9090 
