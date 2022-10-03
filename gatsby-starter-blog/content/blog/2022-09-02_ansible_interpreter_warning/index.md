---
title: "Ansible 実行時に warning が出力されるので対応する"
date: "2022-09-02T23:59:59.000"
description: "Ansible を実行すると下記のような警告が出力される"
---

Ansible を実行すると下記のような警告が出力される  
Python のインタプリタを別でインストールすると意味が変わる可能性があるとのこと

```sh
$ ansible-playbook -i hosts/localhost mac.yml

PLAY [mac setup] ***************************************************************

TASK [homebrew : homebrew install] *********************************************
ok: [127.0.0.1] => (item={'name': 'jq', 'state': 'installed'})
ok: [127.0.0.1] => (item={'name': 'peco', 'state': 'installed'})
[WARNING]: Platform darwin on host 127.0.0.1 is using the discovered Python
interpreter at /usr/local/bin/python3.10, but future installation of another
Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-
core/2.13/reference_appendices/interpreter_discovery.html for more information.
```


## 対応方法

`ansible.cfg` を追加する  
明示的に Python のインタプリタを指定してあげる  
Ansible 実行時はここで指定したパスが使用される

```
[defaults]
interpreter_python=/usr/bin/python3
```

## 確認

警告がでなくなったことを確認した

```sh
$ ansible-playbook -i hosts/localhost mac.yml

PLAY [mac setup] ***************************************************************

TASK [homebrew : homebrew install] *********************************************
ok: [127.0.0.1] => (item={'name': 'jq', 'state': 'installed'})
ok: [127.0.0.1] => (item={'name': 'peco', 'state': 'installed'})

PLAY RECAP *********************************************************************
127.0.0.1                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```


## 参考

- [[小ネタ] Pythonのバージョンを指定してAnsible実行時に表示される警告を消す | DevelopersIO](https://dev.classmethod.jp/articles/ansible-interpreter-warning/)
