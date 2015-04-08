FROM phusion/baseimage
MAINTAINER Federico Carrone <federico.carrone@gmail.com>

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2015-02-12

RUN apt-get update

ENV ERLANG_VERSION 17.4
ENV ERL_EPMD_PORT 4369

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update

ADD . /build
RUN /build/install.sh

# Expose
EXPOSE ${ERL_EPMD_PORT}

# Leverage the baseimage-docker init system
CMD ["/sbin/my_init"]
