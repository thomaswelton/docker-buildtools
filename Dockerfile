FROM thomaswelton.com:5000/ubuntu

MAINTAINER thomaswelton

RUN       apt-get install -y build-essential python wget

# NODE V0.10.25
RUN       wget http://nodejs.org/dist/v0.10.25/node-v0.10.25.tar.gz
RUN       tar -zxvf node-v0.10.25.tar.gz
RUN       rm node-v0.10.25.tar.gz
WORKDIR   node-v0.10.25

# INSTALL NODE
RUN       ./configure
RUN       make
RUN       make install

# CLEAN UP
WORKDIR   ..
RUN       rm -r node-v0.10.25

# Ruby

RUN apt-get install -y python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -qq update

RUN apt-get install -y ruby2.0 ruby2.0-dev rubygems ruby-switch
RUN ruby-switch --set ruby2.0

RUN gem install rake bundler --no-rdoc --no-ri

RUN apt-get remove -y build-essential python wget python-software-properties

RUN npm install -g gulp

ADD run.sh /run.sh
CMD ["/bin/bash", "/run.sh"]
