FROM eclipse-temurin:19_36-jdk-focal as builder
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN ./mvnw clean install -DskipTests

FROM builder
COPY --from=builder /app/source/target/eureka-0.0.1-SNAPSHOT.jar /app/app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]