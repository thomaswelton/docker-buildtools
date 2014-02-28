FROM thomaswelton.com:5000/node

MAINTAINER thomaswelton

RUN npm install -g gulp bower

ADD run.sh /run.sh

WORKDIR /app
CMD ["/bin/bash", "/run.sh"]
