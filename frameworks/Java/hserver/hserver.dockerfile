FROM maven:3.6.1-jdk-11-slim as maven
WORKDIR /hserver
COPY pom.xml pom.xml
COPY src src
RUN mvn package

FROM openjdk:11.0.3-jdk-slim
WORKDIR /hserver
COPY --from=maven /hserver/target/hserver-1.0.jar app.jar

EXPOSE 8888

CMD ["java", "-server", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-XX:+AggressiveOpts", "-Dio.netty.buffer.checkBounds=false", "-Dio.netty.buffer.checkAccessible=false", "-Dio.netty.iouring.iosqeAsyncThreshold=32000", "-jar", "app.jar"]
