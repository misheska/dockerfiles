FROM alpine:latest
LABEL maintainer "Mischa Taylor <sheska@linux.com>"

RUN apk --no-cache add \
      python3 \
    && pip3 install --upgrade pip setuptools \
    && pip3 install awscli \
    && rm -r /root/.cache

ENTRYPOINT [ "aws" ]
