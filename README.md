[docker-erlang](https://registry.hub.docker.com/u/unbalancedparentheses/erlang/)
=============

Docker Image packaging for Erlang

#What is it?

Docker container images that include [Erlang/OTP](http://www.erlang.org/). Rebar and Relx are not part of official Erlang distribution and each has its own release cycle. If you need those tools, you need to add those yourself.

The latest versions of Erlang/OTP are provided as tags.

#What can I use it for?

Use it to try out the erlang shell, as an erlang development environment, or use it as a base image for your own erlang applications.

#Usage

Start a throwaway instance of the erlang shell

```bash
docker run -it --rm unbalancedparentheses/erlang
```

Run a container to use a development environment

```bash
docker run -it --name erlang-dev unbalancedparentheses/erlang /bin/bash
```
