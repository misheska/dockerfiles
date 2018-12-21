FROM alpine:latest
LABEL maintainer "Mischa Taylor <sheska@linux.com>"

RUN apk add --no-cache --virtual .certbot-deps \
      python \
      py2-pip \
      libffi \
      openssl \
      ca-certificates \
      binutils \
    && pip install --upgrade pip setuptools
RUN apk add --no-cache --virtual .build-deps \
      gcc \
      musl-dev \
      libffi-dev \
      openssl-dev \
      python2-dev \
    && pip install acme \
    && pip install certbot-dns-route53 \
    && pip install awscli \
    && mkdir -p /root/.aws \
    && { \
      echo '[default]'; \
      echo 'output = json'; \
      echo 'region = $AWS_DEFAULT_REGION'; \
    } > /root/.aws/config \
    && { \
      echo '[default]'; \
      echo 'aws_access_key_id = $AMAZON_ACCESS_KEY_ID'; \
      echo 'aws_secret_access_key = $AMAZON_SECRET_ACCESS_KEY'; \
    } > /root/.aws/credentials \
    && apk del .build-deps \
    && rm -r /root/.cache

ENTRYPOINT [ "certbot" ]
