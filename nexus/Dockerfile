# Use Alpine Linux as the base image
FROM alpine:3.16

# Define Nexus version and URLs
ENV NEXUS_VERSION=3.72.0-04 
ENV NEXUS_TARBALL_URL=https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz \
    INSTALL4J_ADD_VM_PARAMS="-Xms1200m -Xmx1200m" \
    INSTALL4J_JAVA_HOME=/usr/lib/jvm/java-11-openjdk 

# Install dependencies including OpenJDK 11
RUN apk add --no-cache --update bash ca-certificates curl wget openjdk11-jre \
  && cd /tmp \
  && wget -O nexus.tar.gz $NEXUS_TARBALL_URL \
  && tar -xf nexus.tar.gz \
  && mkdir -p /opt/sonatype /opt/sonatype-work/nexus3/log /opt/sonatype-work/nexus3/tmp \
  && mv nexus-${NEXUS_VERSION} /opt/sonatype/nexus \
  && adduser -h /nexus-data -DH -s /sbin/nologin nexus \
  && chown -R nexus:nexus /opt/sonatype /opt/sonatype-work \
  && rm -rf /tmp/* /var/cache/apk/*

# Copy the user creation script
COPY nexus-default.properties /opt/sonatype/nexus/etc/nexus-default.properties
COPY create-nexus-users.sh /opt/sonatype/create-nexus-users.sh
RUN chmod +x /opt/sonatype/create-nexus-users.sh

# Expose Nexus port
EXPOSE 8081

# Define volumes for Nexus data and sonatype work directory
VOLUME /nexus-data /opt/sonatype-work

# Set working directory
WORKDIR /opt/sonatype/nexus

# Start Nexus
USER nexus

# Start Nexus and create user
# ENTRYPOINT ["sh", "-c", "bin/nexus run & /opt/sonatype/create-nexus-users.sh && fg"]
ENTRYPOINT ["sh", "-c", "/opt/sonatype/create-nexus-users.sh & exec bin/nexus run"]