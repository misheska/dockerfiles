FROM debian:stretch-slim
LABEL maintainer "Mischa Taylor <sheska@linux.com>"

RUN apt-get update \
    && apt-get install -y \
      file \
      shellcheck \
    && rm -rf /var/lib/apt/lists/*
     
CMD [ "shellcheck" ]
