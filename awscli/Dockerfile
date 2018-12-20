FROM alpine:latest
LABEL maintainer "Mischa Taylor <sheska@linux.com>"

RUN apk --no-cache add \
      ca-certificates \
      python3 \
    && pip3 install --upgrade pip setuptools \
    && pip3 install awscli \
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
    && rm -r /root/.cache

ENTRYPOINT [ "aws" ]
