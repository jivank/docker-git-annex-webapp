FROM debian:sid
ENV LISTEN_ADDRESS 127.0.0.1 
RUN mkdir /data
RUN apt update
RUN apt install tini git-annex -y && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/bin/bash","-c","git annex webapp --listen=${LISTEN_ADDRESS}"]
