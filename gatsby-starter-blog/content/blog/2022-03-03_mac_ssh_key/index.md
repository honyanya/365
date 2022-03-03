---
title: "macOS の SSH 接続時の秘密鍵パスワードを Keychain に保存する"
date: "2022-03-03T22:10:00.000"
---

毎回入力していたので覚えさせる方法が無いかを調べた  
緊急じゃないのでずっと後回しにしていた  

`~/.ssh/config` の先頭に下記を入力すれば Keychain に保存される  
`UseKeychain yes` と `AddKeysToAgent yes` の二つを書く  

```sh
# passphrases keychain
Host *
   UseKeychain yes
   AddKeysToAgent yes
   IdentityFile ~/.ssh/id_rsa
```

もし意図的に違う鍵を使ってて毎回入力したいときは Host ごとに設定してあげた方が良いと思う

参考

- [macOS Sierra の SSH で、秘密鍵のパスフレーズが Keychain 保存されない問題の解決方法 - HAM MEDIA MEMO](https://h2ham.net/macos-sierra-use-keychain/)
