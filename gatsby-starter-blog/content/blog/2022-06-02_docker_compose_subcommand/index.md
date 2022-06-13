---
title: "docker compose サブコマンドを使う方法"
date: "2022-06-02T23:59:59.999"
---

ずっと docker の compose サブコマンドではなく `docker-compose` を使っていたため、 compose サブコマンドを使うようにする  
周りは基本的に compose サブコマンドを使っているので取り残されていた  

# 環境

Debian 11.2  
docker コマンドインストール済み


# docker-compose インストール

まずは docker-compose をインストールする

```sh
$ docker -v
Docker version 20.10.12, build e91ed57

$ curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0Running checks...
100  5982  100  5982    0     0  23003      0 --:--:-- --:--:-- --:--:-- 23096
Warning: This script has been tested on Ubuntu and may not work on other distributions
Checks passed!
Downloading CLI...
Downloaded CLI!
Installing CLI...
Done!

$ docker-compose version
Docker Compose version v2.2.3
```

この時点ではサブコマンドは使えない  

```sh
$ docker compose version
docker: 'compose' is not a docker command.
See 'docker --help'
```


# compose サブコマンドインストール

```sh
$ mkdir -p ~/.docker/cli-plugins/
$ curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 23.5M  100 23.5M    0     0  3107k      0  0:00:07  0:00:07 --:--:-- 4251k

$ chmod +x ~/.docker/cli-plugins/docker-compose

$ docker compose version
Docker Compose version v2.2.3
```


# 参考

- [docker-compose と docker サブコマンドの compose って結局どっち使えばいいのかという話 - おおくまねこ](https://keyno63.hatenablog.com/entry/2021/07/24/231528)
- [DockerとDocker ComposeをUbuntu 20.04にインストールする。2022年冬 - Qiita](https://qiita.com/abetomo/items/7ec217c28b54bce7a336#installing-compose-v2)
