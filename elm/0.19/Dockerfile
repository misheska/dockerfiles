FROM alpine:3.9

RUN set -xe \
	&& apk add binutils \
	&& wget -qO - "https://github.com/elm/compiler/releases/download/0.19.0/binaries-for-linux.tar.gz" | tar -zxC /usr/local/bin/ \
	&& strip /usr/local/bin/elm \
	&& apk del binutils
