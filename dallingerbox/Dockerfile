FROM ubuntu:14.04

LABEL maintainer="Bill Thompson <billdthompson@berkeley.edu>"

USER root

# install python, pip, git, wget
RUN apt-get update \
	&& apt-get install -y --no-install-recommends python2.7 python-pip python-dev build-essential git wget \
	&& pip install --upgrade pip

# install postgres
RUN apt-get -y --no-install-recommends install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# install redis
RUN wget http://download.redis.io/redis-stable.tar.gz \
	&& tar xvzf redis-stable.tar.gz \
	&& cd redis-stable \
	&& make \
	&& sudo make install \
	&& cd ../ \
	&& rm -r redis-stable.tar.gz

# install heroku
RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# install Dallinger
RUN pip install dallinger[data]

