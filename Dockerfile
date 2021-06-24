FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

USER 1001

RUN curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.1/spring-boot-cli-2.5.1-bin.zip -o spring > /home/eduk8s/bin && fix-permissions /home/eduk8s/bin

RUN fix-permissions /home/eduk8s
