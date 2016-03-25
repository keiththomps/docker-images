FROM msaraiva/elixir-dev
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2016-03-25

WORKDIR /root

RUN apk --update add bash vim tmux git-bash-completion the_silver_searcher && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /root/.vim/bundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim

COPY elixir.vimrc .vimrc
COPY tmux.conf /etc/tmux.conf
COPY prompt.sh /etc/profile.d/prompt.sh

RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null || true

CMD ["/bin/bash", "-l"]
