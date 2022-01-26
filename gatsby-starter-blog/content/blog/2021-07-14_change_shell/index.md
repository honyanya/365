---
title: "shell を切り替える"
date: "2021-07-14T00:00:00.000Z"
description: "bash 以外にも zsh を触っておいた方が良いかなと思ってて"
tags:
  - none
---

bash 以外にも zsh を触っておいた方が良いかなと思ってて  
なかなか重い腰を上げられていないが、切替方法をメモしておく  

shell の一覧  

```sh
$ cat /etc/shells 
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

zsh に切り替える  

```sh
$ /bin/zsh
```

永続的に切り替える  

```sh
$ chsh -s /bin/zsh
```

```sh
% printenv SHELL
/bin/zsh
```

戻す時も chsh で変更する  

```sh
$ chsh -s /bin/bash
```

- 参考
  - [chsh | ログインシェルを変更するためのコマンド](https://bi.biopapyrus.jp/os/linux/chsh.html)