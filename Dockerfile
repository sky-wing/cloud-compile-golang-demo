FROM centos

RUN mkdir -p /root/service
COPY $OUTPUT /root/service
WORKDIR /root/service/bin
ENTRYPOINT ["/root/service/bin/control", "start"]
