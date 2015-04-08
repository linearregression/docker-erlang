#!/usr/bin/env bash

apt-get install -y \
        libncurses5-dev \
        openssl \
        libssl-dev \
        libatomic-ops\
        libatomic-ops-dev \
        fop \
        xsltproc \
        unixodbc-dev \
        automake \
        build-essential \
        curl \
        wget \
        git

mkdir -p /usr/src/erlang
wget http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz -P /usr/src/erlang
cd /usr/src/erlang \
    && tar zxf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure --enable-threads--enable-smp-support --enable-kernel-poll --enable-fp-exceptions --enable-m64-build --with-termcap --without-javac --with-ssh --without-libatomic_ops --enable-dirty-schedulers \
    && make \
    && make release_tests \
    && make install \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src/*
