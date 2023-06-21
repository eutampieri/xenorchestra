FROM ubuntu:latest
COPY xo_*.sh /
RUN bash /xo_install_0_deps.sh
#RUN bash /xo_install_1_yarn.sh
RUN bash /xo_install_1_n.sh
RUN n lts
RUN corepack enable
RUN /usr/bin/apt-get install --yes build-essential redis-server libpng-dev git python3-minimal libvhdi-utils nfs-common lvm2 cifs-utils
RUN bash /xo_install_2_xo.sh

WORKDIR /opt/xen-orchestra/packages/xo-server/
CMD bash /xo_start.sh
EXPOSE 80
