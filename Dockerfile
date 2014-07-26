# Dockerfile for adding etcd to a base image

FROM ubuntu:latest

MAINTAINER Vincent Palmer <shift-gh@someone.section.me>

ENV ETCD_VERSION v0.4.5
ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y curl

RUN mkdir /tmp/etcd
RUN curl -L https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz | tar -xz --directory /tmp/etcd --strip-components 1
RUN cp /tmp/etcd/etcd /usr/local/bin/ && cp /tmp/etcd/etcdctl /usr/local/bin/
RUN rm -rf /tmp/etcd
