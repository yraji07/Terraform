#!/bin/bash 
sudo apt update 
sudo apt install apache2 -y
sudo apt install openjdk-17-jdk -y
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar