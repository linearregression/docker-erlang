#!/usr/bin/env bash

apt-get install -y \
        libncurses5-dev \
        openssl \
        libssl-dev \
        libatomic1 \
        libatomic-ops-dev \
        libwxgtk2.8 \
        libwxgtk2.8-dev \
        libwxbase2.8-0 \
        libwxbase2.8-dev \ 
        fop \
        xsltproc \
        unixodbc \
        unixodbc-dev \
        automake \
        build-essential \
        curl \
        wget \
        git

mkdir -p /usr/src/erlang
#curl -G --data-binary http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz -O /usr/src/erlang/otp_src_${ERLANG_VERSION}.tar.gz
wget http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz -P /usr/src/erlang
cd /usr/src/erlang \
    && tar zxf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure --enable-threads--enable-smp-support --enable-kernel-poll --enable-fp-exceptions --enable-m64-build --with-termcap --without-javac --with-ssh --with-libatomic_ops --enable-dirty-schedulers \
    && make \
    && make install \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src/*
