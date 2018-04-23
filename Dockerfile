FROM debian:latest
MAINTAINER WorksAsIntended <marc@marschalls.net>
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y  install \
  vim \
  tree \
  watch \
  whois \
  nano \
  sudo  
RUN apt-get clean && rm -rf /var/lib/apt/lists/* 

