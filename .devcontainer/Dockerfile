FROM ubuntu:24.04

ARG HOST_DOCKER_GROUP_ID

RUN mkdir /workspace/

# Install Docker CLI
RUN apt-get update
RUN apt-get install -y ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get install -y docker-ce-cli

RUN apt-get install -y git
RUN apt-get install -y gnupg2

# Give sudo permissions to ubuntu user.
RUN apt-get install -y sudo
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu

# Add ubuntu user to docker group.
RUN groupadd docker && \
    groupmod -g $HOST_DOCKER_GROUP_ID docker && \
    usermod -aG docker ubuntu

RUN apt-get install -y nano

# Install PHP
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y php

# Install required PHP extensions for testing.
RUN apt-get install -y php-dom php-mbstring php-xml php-sqlite3

USER ubuntu
