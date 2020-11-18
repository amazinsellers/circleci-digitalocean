FROM circleci/buildpack-deps:stretch

USER root

WORKDIR /tmp
RUN wget https://github.com/digitalocean/doctl/releases/download/v1.52.0/doctl-1.52.0-linux-amd64.tar.gz
RUN tar xf doctl-1.52.0-linux-amd64.tar.gz
RUN mv ./doctl /usr/local/bin

RUN apt-get update && apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

USER circleci