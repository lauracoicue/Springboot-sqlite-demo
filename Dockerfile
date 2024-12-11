FROM maven:3.9.9-eclipse-temurin-17 AS build

#Directorio de trabajo
WORKDIR /app

#Copia de las carpetas necesarias para poder compilar
COPY pom.xml .
COPY src ./src
COPY user.db ./user.db

#POder correr el mvn
RUN mvn package

#Lo que se ejecuta cuando compilo
CMD ["java", "-jar", "target/sqlitedb-1.0-SNAPSHOT.jar"]

#EXponemos el puerto que se va a usar
EXPOSE 8080