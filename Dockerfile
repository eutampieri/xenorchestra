FROM ubuntu:latest
COPY xo_*.sh /
RUN bash /xo_install_0_yarn_deps.sh
#RUN bash /xo_install_1_yarn.sh
RUN bash /xo_install_2_n.sh
RUN n lts
RUN corepack enable
RUN /usr/bin/apt-get install --yes build-essential redis-server libpng-dev git python3-minimal libvhdi-utils nfs-common lvm2 cifs-utils
RUN bash /xo_install_3_xo.sh
RUN ls /opt/

WORKDIR /opt/xen-orchestra/packages/xo-server/
CMD ls /opt/xen-orchestra/packages/xo-server/&&/usr/local/bin/node ./dist/cli.mjs
EXPOSE 80
