FROM keiththomps/elixir
MAINTAINER Keith Thompson "me@keiththomps.com"
ENV LAST_UPDATED 2015-11-29

RUN apt-get install -yqq \
  vim \
  silversearcher-ag

RUN mkdir -p ~/.vim/bundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY elixir.vimrc /root/.vimrc

CMD ["bash"]
