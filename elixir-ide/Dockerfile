FROM keiththomps/elixir
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2015-12-11

ENV EDITOR vim

WORKDIR /root

RUN apt-get -q update && \
  apt-get install --no-install-recommends -y --force-yes -q \
    ca-certificates \
    tmux \
    curl \
    git \
    vim-nox \
    rubygems \
    build-essential \
    silversearcher-ag \
    && \
  apt-get clean && \
  rm /var/lib/apt/lists/*_*

RUN gem install tmuxinator

RUN mkdir -p ~/.vim/bundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY elixir.vimrc .vimrc
COPY tmuxinator /root/.tmuxinator
COPY tmux.conf /etc/tmux.conf

RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null || true

CMD /usr/local/bin/tmuxinator start default
