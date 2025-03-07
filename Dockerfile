FROM ubuntu:latest AS base

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y2 python3 python3-pip python3-venv ca-certificates

RUN python3 -m venv /opt/venv

COPY requirements.txt /opt/

RUN source /opt/venv/bin/activate && \
    pip3 install -r requirements.txt
