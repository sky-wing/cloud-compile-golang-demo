FROM centos
MAINTAINER ark ark-team@jd.com
RUN mkdir -p /root/service
COPY $out_dir /root/service
WORKDIR /root/service/bin
ENTRYPOINT ["/root/service/bin/control", "start"]
