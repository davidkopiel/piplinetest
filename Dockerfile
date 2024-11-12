davidko.io:80/artifactory/davidnewdocker/ubuntu                         16.04               d125c6a1fe22   2 years ago     119MB
# Stage 1: Build with Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
RUN mvn dependency:copy -Dartifact=org.apache.logging.log4j:log4j-core:2.8.2 -DoutputDirectory=/libs

# Stage 2: Create the final image based on the original image
FROM jfrog/demo-security
WORKDIR /app
COPY --from=build /libs /libs

# Keep the container running (or specify your command)
CMD ["tail", "-f", "/dev/null"]
~
~
~
