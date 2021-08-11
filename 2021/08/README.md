# 2021/08

<!-- TOC -->

- [2021/08](#202108)
    - [2021/08/01 Sun](#20210801-sun)
    - [2021/08/02 Mon](#20210802-mon)
    - [2021/08/03 Tue](#20210803-tue)
    - [2021/08/04 Wed](#20210804-wed)
    - [2021/08/05 Thu](#20210805-thu)
    - [2021/08/06 Fri](#20210806-fri)
    - [2021/08/07 Sat](#20210807-sat)
    - [2021/08/08 Sun](#20210808-sun)

<!-- /TOC -->


## 2021/08/01 Sun

Mac でスクリーンショットのファイル名を変更する  

下記のコマンドで変更ができる  
`name` で名前、 `include-date` で日時をどうするかを決める  

```sh
## `スクリーンショット 2021-08-01 23.56.11.png` -> `screenshot.png`
$ defaults write com.apple.screencapture name "screenshot"
$ defaults write com.apple.screencapture include-date -bool false

## デフォルトに戻す
$ defaults write com.apple.screencapture name スクリーンショット
$ defaults delete com.apple.screencapture include-date
```

`killall SystemUIServer` は Sierra 以降なら不要みたい

- 参考
  - [Macでスクリーンショットのファイル名・形式・保存場所を変更する | Qookie Tech](https://tech.qookie.jp/posts/custom-mac-screenshot/)
  - [[macOS] そのkillallは本当に必要？ [screenshot] - Qiita](https://qiita.com/masakihori/items/646bad690b14cb6df430)


## 2021/08/02 Mon

AWS S3 で圧縮されたファイルを手元で確認する  

少し前に AWS S3 で圧縮されたファイルの中身を確認したいことがあって  
ブラウザからダウンロードして解答して確認するのは大変だったりする  
aws cli でできないものかと思ってたら普通にできるみたい  

```sh
$ aws s3 cp s3://[bucket_name]/sample.gz - | zgrep 'hogefuga'
```

`aws s3 cp` で target を `-` にすると標準出力になる  
[公式ドキュメント](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-services-s3-commands.html#using-s3-commands-managing-objects-copy)にもストリームされる旨が書いてある  

- 参考
  - [AWS S3上ファイルの中身をLinuxコマンドだけで超絶簡単に確認する方法 - Qiita](https://qiita.com/mimimi-no-sesese/items/0e7955172ab53ccbbde1)


## 2021/08/03 Tue

React チュートリアルを触る  

Gatsby.js を触ったがいまいち理解ができていないので、大元の React.js を触ってみることにした  

Node.js インストールは済み  

まずは[ここ](https://ja.reactjs.org/docs/create-a-new-react-app.html#create-react-app)を見てローカルに React の環境を作る  

```sh
$ npx create-react-app my-app
$ cd my-app/
$ yarn start
```

http://localhost:3000/ にアクセスすると以下のように React のロゴが回っている  

![1_yarn_start](./images/03/1_yarn_start.png)  

`Edit src/App.js and save to reload.` とあるので見てみる  

`App()` の中の HTML を返している  

```js
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}
```

返す HTML をシンプルにする  

```js
function App() {
  return (
    <div className="App">
      <h1>Hello World!</h1>
    </div>
  );
}
```

これで Hello World! が出力される  


## 2021/08/04 Wed

React チュートリアルを触る#2  

まだまだ準備編  
まずはチュートリアルに書いてあるとおり、 `src` ディレクトリ内を削除する  

```sh
$ cd my-app
$ cd src
$ rm -f *
$ cd ..
```

4~6 の手順を進める  
`index.css`, `index.js` を作る  
コードは Codepen に書いてあるのでそのままコピーして持ってくる  

ここでブラウザで動作確認すると五目並べの表示が確認できる  

![1_board](./images/04/1_board.png)  

ローカルでチュートリアルできる準備が整ったので写経をしていく  


## 2021/08/05 Thu

GitHub で PR が閉じて Reopen もできない  

この 365 は PR を通して行っている  
ブランチ作成、 PR 作成など、複数でやっている  

rebase 後に force push すると勝手に PR が閉じられて Reopen もできなくなった  

![1_github_pr](./images/05/1_github_pr.png)

`There are no new commits on the feature/xxx branch.` と書いてあった  
（画像は撮り忘れた......）  

新しいコミットを push することで Reopen することができた  
![2_github_pr](./images/05/2_github_pr.png)  


## 2021/08/06 Fri

HTML で同じ要素に存在しているテキストを取得する  

半スクレイピング的なこと  
よくまとめて情報取得したいが、ガッツリコードを書くほどでも無いってときは開発者ツールのコンソールを使用している  

こんな HTML があったとして  

```html
<div class="contents">
  <div class="hoge_name">eins</div>
  <div class="hoge_name">zwei</div>
  <div class="hoge_name">drei	</div>
  <div class="hoge_name">vier</div>
  <div class="hoge_name">fünf</div>
</div>
```

こんな JS をブラウザのコンソールで実行すれば取得ができる  

```js
Array.from(document.getElementsByClassName('hoge_name')).map(element => element.innerText);
// (5) ["eins", "zwei", "drei", "vier", "fünf"]
```

`getElementsByClassName` だと `HTMLCollection` のが返ってくる  

```js
document.getElementsByClassName('hoge_name');
// HTMLCollection(5) [div.hoge_name, div.hoge_name, div.hoge_name, div.hoge_name, div.hoge_name]
```

そのため、 [Array.form](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/from) メソッドを使用して、 Array インスタンスを生成する  
[Array.prototype.map](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/map) メソッドを使用して、各 Element のテキストのみを抽出している  


## 2021/08/07 Sat

pyenv で Python のバージョンが切り替わらなかったときの対応  

Python の新しいバージョンをインストールする  
複数のバージョンを入れれるよう pyenv を使うことにした  

特に設定は変えていないので、システムのデフォルトは Python2 になっている  

```sh
$ python --version
Python 2.7.10

$ which python
/usr/bin/python
```

GitHub から clone して pyenv を入れる  

```sh
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv

$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(pyenv init )"' >> ~/.bashrc
$ source ~/.bashrc

$ pyenv --version
pyenv 2.0.4-8-gd209e061

$ pyenv install 3.9.6
$ pyenv global 3.9.6
```

インストール時はこんな感じ  
openssl と python をインストールしていた  

```sh
$ pyenv install 3.9.6
Downloading openssl-1.1.1k.tar.gz...
-> https://www.openssl.org/source/openssl-1.1.1k.tar.gz
Installing openssl-1.1.1k...
Installed openssl-1.1.1k to /Users/user/.pyenv/versions/3.9.6

python-build: use readline from homebrew
Downloading Python-3.9.6.tar.xz...
-> https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tar.xz
Installing Python-3.9.6...
python-build: use readline from homebrew
Installed Python-3.9.6 to /Users/user/.pyenv/versions/3.9.6
```

しかし Python のバージョンは変わらなかった  

```sh
$ python --version
Python 2.7.10

$ which python
/usr/bin/python
```

`pyenv init` を実行してみた  

```sh
$ pyenv init

# (The below instructions are intended for common
# shell setups. See the README for more guidance
# if they don't apply and/or don't work for you.)

# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# If your ~/.profile sources ~/.bashrc,
# the lines need to be inserted before the part
# that does that. See the README for another option.

# If you have ~/.bash_profile, make sure that it
# also executes the above lines -- e.g. by
# copying them there or by sourcing ~/.profile

# Load pyenv into the shell by adding
# the following to ~/.bashrc:

eval "$(pyenv init -)"

# Make sure to restart your entire logon session
# for changes to profile files to take effect.
```

`to ~/.profile:` に `eval "$(pyenv init --path)"` を書いてあるため修正してみた  

```diff
- eval "$(pyenv init -)"
+ eval "$(pyenv init --path)"
```

これでバージョンが変わった  

```sh
$ source ~/.bashrc

$ which python
/Users/user/.pyenv/shims/python

$ python --version
Python 3.9.6
```

Python3 の最新バージョン入れるまとめ  

```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv

$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
$ source ~/.bashrc

$ pyenv --version
pyenv 2.0.4-8-gd209e061

$ pyenv install 3.9.6
$ pyenv global 3.9.6

$ which python
/Users/user/.pyenv/shims/python

$ python --version
Python 3.9.6
```

- 参考
  - [pyenv globalでpythonのバージョンが切り替わらない(mac) - Qiita](https://qiita.com/jackbook1750/items/a8513a1cadd702d84651)
  - [pyenvでPythonのバージョンを切り替えられない場合の対処法＋ - Qiita](https://qiita.com/TheHiro/items/88d885ef6a4d25ec3020)


## 2021/08/08 Sun

pip のバージョンを上げる  

virtualenv を pip で入れた際にバージョンを上げてねというメッセージが出た  

```sh
$ pip install virtualenv
...
WARNING: You are using pip version 21.1.3; however, version 21.2.3 is available.
You should consider upgrading via the '/Users/user/.pyenv/versions/3.9.6/bin/python3.9 -m pip install --upgrade pip' command.
```

現在の pip のバージョン  

```sh
$ pip --version
pip 21.1.3 from /Users/user/.pyenv/versions/3.9.6/lib/python3.9/site-packages/pip (python 3.9)
```

バージョンを上げる  

```sh
$ python -m pip install --upgrade pip
```

21.1.3 -> 21.2.3 に上がったことを確認した  

```
$ pip --version
pip 21.2.3 from /Users/user/.pyenv/versions/3.9.6/lib/python3.9/site-packages/pip (python 3.9)
```

