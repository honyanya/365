---
title: "Rust で Hello World した"
date: "2022-04-19T23:55:00.000"
---

Rust が全くわらかなかったので[イベント](https://estie.connpass.com/event/243724/)に参加してみた  
気持ちがあるうちに触ってみる  
こういうのはノリと勢いが大事  


## Rust インストールする

[公式のインストール内容](https://www.rust-lang.org/ja/tools/install) に書いてある方法で行う  

```sh
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

インストール時にはこんな感じの内容が出てくる  
途中出てくる選択は `1` を選択した  

```
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

  /home/vagrant/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory located at:

  /home/vagrant/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

  /home/vagrant/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile files located at:

  /home/vagrant/.profile
  /home/vagrant/.bashrc
  /home/vagrant/.zshenv

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable (default)
               profile: default
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
>1

info: profile set to 'default'
info: default host triple is x86_64-unknown-linux-gnu
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2022-04-07, rust version 1.60.0 (7737e0b5c 2022-04-04)
info: downloading component 'cargo'
info: downloading component 'clippy'
info: downloading component 'rust-docs'
info: downloading component 'rust-std'
info: downloading component 'rustc'
 54.6 MiB /  54.6 MiB (100 %)  25.5 MiB/s in  2s ETA:  0s
info: downloading component 'rustfmt'
info: installing component 'cargo'
info: installing component 'clippy'
info: installing component 'rust-docs'
 19.5 MiB /  19.5 MiB (100 %)  15.7 MiB/s in  1s ETA:  0s
info: installing component 'rust-std'
 26.3 MiB /  26.3 MiB (100 %)  19.7 MiB/s in  1s ETA:  0s
info: installing component 'rustc'
 54.6 MiB /  54.6 MiB (100 %)  23.6 MiB/s in  2s ETA:  0s
info: installing component 'rustfmt'
info: default toolchain set to 'stable-x86_64-unknown-linux-gnu'

  stable-x86_64-unknown-linux-gnu installed - rustc 1.60.0 (7737e0b5c 2022-04-04)


Rust is installed now. Great!

To get started you may need to restart your current shell.
This would reload your PATH environment variable to include
Cargo's bin directory ($HOME/.cargo/bin).

To configure your current shell, run:
source $HOME/.cargo/env
```

インストール後は `~/.zshrc` の末尾に追加した

```sh
## Rust
source $HOME/.cargo/env
```

バージョンを確認する  

```sh
$ rustc --version
rustc 1.60.0 (7737e0b5c 2022-04-04)
```

便利なコンポーネントはインストールしておく  

```sh
$ rustup component add rust-src
info: downloading component 'rust-src'
info: installing component 'rust-src'
$ rustup component add rust-analysis
info: downloading component 'rust-analysis'
info: installing component 'rust-analysis'
$ rustup component add rls
info: downloading component 'rls'
info: installing component 'rls'
```


## Rust Hello World

`hello.rs` を作成する

```rs
fn main() {
  println!("Hello World!");
}
```

`rustc` でコンパイルして実行する

```sh
$ rustc hello.rs
$ ./hello
Hello World!
```
