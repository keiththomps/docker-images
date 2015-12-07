FROM keiththomps/elixir
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2015-12-06

WORKDIR /root

RUN apt-get install -yqq \
  vim \
  silversearcher-ag

RUN mkdir -p ~/.vim/bundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY elixir.vimrc .vimrc
RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall > /dev/null || true

CMD ["bash"]
