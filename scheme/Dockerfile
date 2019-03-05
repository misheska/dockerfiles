FROM alpine:3.9

RUN set -eux \
	&& apk add --no-cache --virtual .build-deps build-base m4 \
	&& wget -O mit-scheme.tar.gz https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/10.1.5/mit-scheme-10.1.5-x86-64.tar.gz \
	&& mkdir -p mit-scheme \
	&& tar xzvf mit-scheme.tar.gz --strip-components=1 -C mit-scheme  \
	&& rm mit-scheme.tar.gz \
	\
	&& cd mit-scheme/src \
	&& ./configure \
	&& make compile-microcode \
	&& make install \
	\
	&& rm -rf /mit-scheme \
	&& apk del .build-deps

ENTRYPOINT ["scheme"] 
