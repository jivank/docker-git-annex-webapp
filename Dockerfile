FROM debian:buster
ENV LISTEN_ADDRESS 127.0.0.1 
RUN mkdir /data
RUN apt update
RUN apt install git-annex -y && rm -rf /var/lib/apt/lists/*
CMD git annex webapp --listen=$LISTEN_ADDRESS
