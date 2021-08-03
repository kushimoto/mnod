FROM alpine:latest

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:ja" LC_ALL="en_US.UTF-8"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    build-base \
    curl \
    gcc \
    git \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl-dev\
    neovim \
    nodejs \
    npm \
    python3-dev \
    py3-pip \
    ruby \
    ruby-dev && \
    rm -rf /var/cache/apk/*

RUN pip3 install --upgrade pip pynvim

RUN curl -sf https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
    | sh -s /root/.cache/dein

COPY ./config/coc-settings.json /root/.config/nvim/
COPY ./config/coc.rc.vim /root/.config/nvim/
COPY ./config/init.vim /root/.config/nvim/
COPY ./config/toml/dein.toml /root/.config/nvim/toml/
COPY ./config/toml/dein_lazy.toml /root/.config/nvim/toml/

RUN nvim -c "q"
RUN timeout 40s nvim --headless; exit 0

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    go && \
    go get -u golang.org/x/tools/gopls@latest

RUN chmod -R 777 /root/

ENTRYPOINT ["nvim"]
