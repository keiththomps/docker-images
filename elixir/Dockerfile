FROM erlang:18
MAINTAINER Keith Thompson "me@keiththomps.com"

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update -yqq && apt-get install -yqq elixir
