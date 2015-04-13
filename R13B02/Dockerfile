FROM phusion/baseimage
MAINTAINER Federico Carrone <federico.carrone@gmail.com>

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2015-02-12

RUN apt-get update

ENV ERLANG_VERSION R13B02
ENV ERL_EPMD_PORT 4369
ENV DOWNDLOAD /usr/src/erlang

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo ${ERLANG_VERSION}
RUN mkdir -p ${DOWNDLOAD} && echo `ls -l ${DOWNDLOAD}`

RUN apt-get update
RUN apt-get install -y \
        libncurses5-dev \
        openssl \
        libssl-dev \
        libatomic1 \
        libatomic-ops-dev \
        fop \
        xsltproc \
        unixodbc \
        unixodbc-dev \
        automake \
        build-essential \
        curl \
        wget

RUN curl -o ${DOWNDLOAD}/otp_src_${ERLANG_VERSION}.tar.gz http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz 

RUN export CFLAGS="$CFLAGS -std=gnu++11"

RUN cd ${DOWNDLOAD} \
    && tar zxf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure --enable-threads--enable-smp-support --enable-kernel-poll --enable-fp-exceptions --enable-m64-build --with-termcap --without-javac --with-ssh --with-libatomic_ops --enable-dirty-schedulers \
    && make \
    && make install \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src/*

# ADD . /build
# RUN /build/install.sh

# Expose
EXPOSE ${ERL_EPMD_PORT}

# Leverage the baseimage-docker init system
CMD ["/sbin/my_init"]
