FROM msaraiva/elixir-dev
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2016-02-17

ENV EDITOR vim

WORKDIR /root

RUN apk --update add bash vim tmux git-bash-completion the_silver_searcher && \
    rm -rf /var/cache/apk/*

RUN mkdir -p ~/.vim/bundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY elixir.vimrc .vimrc
COPY tmux.conf /etc/tmux.conf

RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null || true

CMD /bin/bash
