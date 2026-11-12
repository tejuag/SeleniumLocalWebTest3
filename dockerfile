
FROM maven:3.9.9-eclipse-temurin-17

WORKDIR /app

RUN apt-get update && apt-get install -y chromium chromium-driver \
    && rm -rf /var/lib/apt/lists/*

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
COPY webpage ./webpage

ENV CHROME_BIN=/usr/bin/chromium

CMD ["mvn", "clean", "test"]