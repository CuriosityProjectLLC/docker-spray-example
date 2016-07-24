# Docker-Spray example
# VERSION 1.0
FROM williamyeh/scala

# that's me!
MAINTAINER Ajish George, ajish@rootedinsights.com

# we need this because the workdir is modified in dockerfile/java
WORKDIR /

# run the (java) server as the daemon user
USER daemon

# copy the locally built fat-jar to the image
ADD target/scala-2.10/snowplow-stream-collector-0.7.0 /app/snowplow-stream-collector-0.7.0
ADD snowplow.config /app/snowplow.config

# run the server when a container based on this image is being run
ENTRYPOINT [ "./app/snowplow-stream-collector-0.7.0", "--config", "/app/snowplow.config" ]

# the server binds to 8080 - expose that port
EXPOSE 8080
