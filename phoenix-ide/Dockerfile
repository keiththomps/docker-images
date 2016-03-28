FROM keiththomps/elixir-ide:1.2
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2016-03-25

ENV NODE_VERSION v5.6.0
ENV NPM_VERSION 3

# Install Node.js & PostgreSQL Client
RUN apk add --no-cache curl make gcc g++ binutils-gold python linux-headers paxctl libgcc libstdc++ postgresql-client && \
  curl -sSL https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.gz | tar -xz && \
  cd node-${NODE_VERSION} && \
  ./configure --prefix=/usr --fully-static && \
  make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  make install && \
  paxctl -cm /usr/bin/node && \
  cd / && \
  if [ -x /usr/bin/npm ]; then \
    npm install -g npm@${NPM_VERSION} && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
  fi && \
  rm -rf /etc/ssl node-${NODE_VERSION} /usr/include \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

# Install Newest phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Add phoenix specific silver searcher ignore file
COPY agignore.phoenix /root/.agignore

# Update Hex  and install new Hex info when launching the ide
RUN mix local.hex --force
RUN mix hex.info
