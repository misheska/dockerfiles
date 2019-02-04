FROM sheska/erlang-otp21

ENV ELIXIR_URL=https://github.com/elixir-lang/elixir/archive/v1.8.1.tar.gz \
    ELIXIR_SHA256="de8c636ea999392496ccd9a204ccccbc8cb7f417d948fd12692cda2bd02d9822" 
ENV LANG=C.UTF-8

RUN set -xe \
        && apk add --no-cache --virtual .fetch-deps \
                curl \
                ca-certificates \
	&& curl -fsSL $ELIXIR_URL -o elixir-src.tar.gz \
	&& echo "$ELIXIR_SHA256  elixir-src.tar.gz" | sha256sum -c - \
        && apk add --no-cache --virtual .build-deps \
                make \
	&& mkdir -p /usr/src/elixir-src \
	&& tar -xzf elixir-src.tar.gz -C /usr/src/elixir-src --strip-components=1 \
	&& rm elixir-src.tar.gz \
	&& cd /usr/src/elixir-src \
	&& make -j$(nproc) \
	&& make install \
	&& rm -rf /usr/src/elixir-src \
        && apk del .fetch-deps .build-deps

CMD ["iex"]
