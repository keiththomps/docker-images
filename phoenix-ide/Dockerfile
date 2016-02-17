FROM keiththomps/elixir-ide:1.2
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2016-02-12

# Update Nodejs Source
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -

# Install Node.js & PostgreSQL Client
RUN apt-get -q update && apt-get install --no-install-recommends -yq \
  nodejs \
  postgresql-client \
  && apt-get clean && rm /var/lib/apt/lists/*_*

# Install Hex
RUN mix local.hex --force

# Install Newest phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Add phoenix specific silver searcher ignore file
COPY agignore.phoenix ~/.agignore
