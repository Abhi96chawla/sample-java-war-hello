#FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
FROM tomcat:9.0-jdk17-openjdk-slim
# Set working directory and copy project files
WORKDIR /usr/local/tomcat/

COPY pom.xml .
# Build the Maven project
RUN mvn package

COPY . .

#FROM tomcat:9.0-jre8-alpine

# Copy the WAR file from the Maven build stage
#COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.war $CATALINA_HOME/webapps/webapp.war

# Expose port 8000 (optional)
EXPOSE 8000

# Start Tomcat
CMD ["catalina.sh", "run"]
