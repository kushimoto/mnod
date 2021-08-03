# mnod

s10akir/moja-nvim を参考にして自分用に作ったnvimコンテナ
docker の上に乗せることによってどこでも同じ環境が再現できるというメリットが享受可能であり、加えて
nvim の alias に設定することであたかもネイティブで動かしているかのような使い勝手を実現する。

## build

```
$ docker build ./ -t kushimoto/nmod
```

## alias

```
$ alias nvim='docker run --rm -it -u $(id -u):$(id -g) -e HOME=/root -v $HOME:$HOME:cached --workdir=$(pwd) kushimoto/mnod'
```

docker hub を利用すれば便利だろうが今のところ私は使っていない。
