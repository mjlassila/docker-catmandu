# Dockerizing Catmandu
# Based on https://github.com/LibreCat/docker-catmandu

FROM debian:stretch


RUN apt-get update && apt-get install -y --no-install-recommends \
  libany-uri-escape-perl \
  libasa-perl \
  libcgi-expand-perl \
  libclone-perl \
  libconfig-onion-perl \
  libcpanel-json-xs-perl \
  libdata-compare-perl \
  libdata-util-perl \
  libdata-uuid-perl \
  libhash-merge-simple-perl \
  libio-handle-util-perl \
  liblist-moreutils-perl \
  liblog-any-perl \
  libmime-types-perl \
  libmodule-info-perl \
  libmoo-perl \
  libmoox-aliases-perl \
  libnamespace-clean-perl \
  libparser-mgc-perl \
  libpath-iterator-rule-perl \
  libpath-tiny-perl \
  libsub-exporter-perl \
  libtext-csv-perl \
  libtext-hogan-perl \
  libthrowable-perl \
  libtry-tiny-byclass-perl \
  liburi-perl \
  liburi-template-perl \
  libwww-perl \
  libyaml-libyaml-perl \
  cpanminus \
  build-essential \
  nano \
  magic-wormhole \
  wget \
  libcatmandu-perl \
  && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos "" catmandu

COPY . /home/catmandu

WORKDIR /home/catmandu

#RUN cpanm -n -q --installdeps . && \
#  rm -rf /var/lib/apt/lists/*

RUN chown catmandu:catmandu *

RUN mkdir /home/catmandu/data
