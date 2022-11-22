FROM openjdk:8
EXPOSE 1000
ADD **/java-jsp-diary.war java-jsp-diary.war
ENTRYPOINT ["java","-war","/java-jsp-diary.war"]
