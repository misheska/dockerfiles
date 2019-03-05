FROM sheska/nodejs-stretch-slim:10.15.1

RUN set -xe \
	&& apt-get update \
	&& apt-get install -y git --no-install-recommends \
	&& npm install -g elm@0.18.0 --unsafe-perm=true --allow-root \
	&& rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]
