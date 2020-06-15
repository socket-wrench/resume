FROM centos:centos8

COPY add-pkgs /root/add-pkgs
RUN /root/add-pkgs

WORKDIR /docs
VOLUME /docs

CMD ["/bin/bash"]
