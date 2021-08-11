FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

USER 1001

RUN mkdir -p /home/eduk8s/bin  && \
    chown 1001:0 /home/eduk8s/bin

WORKDIR /home/eduk8s/bin

ENV PATH=/home/eduk8s/bin/spring-2.5.3/bin/spring:$PATH

RUN fix-permissions /home/eduk8s
