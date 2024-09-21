# Stage 1: Build Jenkins from source
FROM alpine:latest AS builder

# Install necessary dependencies
RUN apk add --no-cache openjdk11-jre wget git

# Download and install Jenkins
ENV JENKINS_VERSION=2.401.3
RUN wget -q -O /tmp/jenkins.war http://mirrors.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war

# Stage 2: Create the final image
FROM alpine:latest

# Install necessary runtime dependencies
RUN apk add --no-cache openjdk11-jre curl bash ttf-dejavu fontconfig

# Create Jenkins user and group
RUN addgroup -S jenkins && adduser -S jenkins -G jenkins

# Set up Jenkins home directory
ENV JENKINS_HOME=/var/jenkins_home
RUN mkdir -p $JENKINS_HOME/plugins && chown -R jenkins:jenkins $JENKINS_HOME

# Copy Jenkins WAR file from the builder stage
COPY --from=builder /tmp/jenkins.war /usr/share/jenkins/jenkins.war

# Copy plugins to jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install Jenkins Plugin Installation Manager
RUN curl -fsSL https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.13.0/jenkins-plugin-manager-2.13.0.jar -o jenkins-plugin-manager.jar

# Install plugins using the manager
RUN java -jar jenkins-plugin-manager.jar \
    --war /usr/share/jenkins/jenkins.war \
    --plugin-file /usr/share/jenkins/ref/plugins.txt

RUN cp -r /usr/share/jenkins/ref/plugins/* $JENKINS_HOME/plugins/

# Copy the JCasC configuration file
COPY jenkins.yaml $JENKINS_HOME/jenkins.yaml

# Set environment variable for JCasC
ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/jenkins.yaml

# Set environment variables
ENV JENKINS_UC=https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
ENV COPY_REFERENCE_FILE_LOG=$JENKINS_HOME/copy_reference_file.log

# Expose Jenkins ports
EXPOSE 8080 50000

# Switch to Jenkins user
USER jenkins

# Start Jenkins
ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
