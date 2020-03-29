FROM debian:testing

RUN mkdir /data
RUN apt update
RUN apt install socat git-annex -y && rm -rf /var/lib/apt/lists/*
ADD start.sh /start.sh
CMD /start.sh

EXPOSE 8888
VOLUME /data
