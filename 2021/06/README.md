# 2021/06

## 2021/06/01 Tue

普段 GitLab 使ってて GitHub 使うと戸惑ったところ  

GitHub に自由に記録を残し初めて 6 月に入りました  
GitHub Pull Request ベースで作っていますが、普段お仕事では GitLab を使ってて  
〇〇がしたいってなった時に UI が異なってるので操作が戸惑っている  

ブランチを作る  

最初どこからブランチを作れば良いのかとなったが、実はブランチ切り替えの場所から作ることができる  
本当に GitHub を触ってなかったので戸惑った......
Issue は使えてないので本当はそこから作るよーかもだけど  

![ブランチを作る 1](./images/01/1_branch_create.png)  
![ブランチを作る 2](./images/01/2_branch_create.png)  

ブランチを消す  

最初はブランチ一覧で都度消していたが、実は PR を merge したあとに削除ができる  
merge 後に Delete branch と出てくるのでそこを押せば OK  
画像はボタン押したあとだけど

![ブランチを削除する](./images/01/3_branch_delete.png)  

確か他にもあった気がするので、都度書いてければ良いかな  


## 2021/06/02 Wed

テキストファイルを複数行出力したい  

ちょっとしたテキストファイルの内容を複数行出力したくて、該当箇所をコピー&ペーストしたい  
cat は全内容をサクッと出力したい時に使うけど、対象箇所までスクロール移動が必要  
grep は対象文字列の検索で使っているので、検索次第では内容が無い場合がある  
less などである場所まで見てみるのもいいけど、これも結局スクロール移動が必要  

調べてみると tail や head をうまく使いこなせばできるみたい  

こんなテキストファイルを用意する  

```txt
1 a い あ 一
2 b ろ い 二
3 c は う 三
4 d に え 四
5 e ほ お 五
6 f へ か 六
7 g と き 七
8 h ち く 八
9 i り け 九
0 j ぬ こ 十
```

`cat [file] | head -n [出力したい末尾の行番号] | tail -n [出力したい末尾の行番号 - (出力したい開始の行番号 + 1)]` で出力できる  

例えば 4~8 行目を出力させたい場合はこんな感じでできる  

```sh
$ cat ./test.txt | head -n 8 | tail -n 5
4 d に え 四
5 e ほ お 五
6 f へ か 六
7 g と き 七
8 h ち く 八
```

やりたいことは cat でやりましたが sed で抽出した方が簡単でした......  
こういう時に同じコマンドばっかり使うのはよろしくない  

```sh
$ sed -n '4, 8p' ./test.txt
4 d に え 四
5 e ほ お 五
6 f へ か 六
7 g と き 七
8 h ち く 八
```

- 参考
  - [【linux】ファイルの特定の範囲の行を取り出すコマンド（headとtail） at softelメモ](https://www.softel.co.jp/blogs/tech/archives/1210)

ちょっと体調が思わしくないので明日以降は更新できない可能性があります  


## 2021/06/03 Thu

Scala 3 のガイドドキュメントを流し見する  

Scala 3 が 2021/05/14 に正式リリースされて、全然情報を追えてないことを反省しながらも[ガイドドキュメント](https://docs.scala-lang.org/ja/scala3/guides.html)があったので軽く見ることにした  
[Compatibility Reference](https://docs.scala-lang.org/scala3/guides/migration/compatibility-intro.html)、[Tour of the Migration Tools | Scala 3 Migration Guide | Scala Documentation](https://docs.scala-lang.org/scala3/guides/migration/tooling-tour.html)、[Scala 3 Migration Mode | Scala 3 Migration Guide | Scala Documentation](https://docs.scala-lang.org/scala3/guides/migration/tooling-migration-mode.html)あたりを見ました  
まだまだ見きれてないけど、メモとしてはこんな感じ  

- Scala 2.13 からの移行はスムーズにできる
  - クロスコンパイルできる
  - Scala 2.13 <- Scala 3 で依存可能
  - 下位／上位互換ができる
  - コンパイルオプション有
- sbt は sbt 1.5 から Scala 3 をサポート
- Metals はサポート有、IntelliJ IDEA は本格的なサポートは準備段階
- Scalafmt v3.0.0-RC3 は Scala 2.13, Scala 3 をサポート
- Scalafix はまだで Scala 2.13 のみ
- [Scala 3 Migrate](https://github.com/scalacenter/scala3-migrate) という移行 sbt プラグインがある
- scalac migration オプション、 rewrite オプションで書き換え可能

ちゃんと言語もライブラリもアップデートしていないと......  

- 参考
  - [Scala 3 のガイド | Scala Documentation](https://docs.scala-lang.org/ja/scala3/guides.html)

胃腸の調子、疲労感は昨日と比べて回復しました  


## 2021/06/04 Fri

個人の環境依存ファイルの除外の仕方を考える  

Git ではバージョン管理したくないファイルを `.gitignore` で管理している  
この `honyanya / 365` リポジトリも `.gitignore` を用意している  

今ある `.gitignore` はこんな感じ  

```sh
## Mac
.DS_Store
```

macOS で自動生成される `.DS_Store` を除外扱いにしている  
他にも `.swp` や Windows で生成される `Thumb.db` とかもよく入るかな  
ディレクトリで言うと `.idea/` とかも入るみたい  

同期から↑のような個人の環境依存ファイルは `.gitignore` は含めないで、 `core.excludesFile` に含めると良いアドバイスをもらった   
`.gitignore_global` に書くのが良いとのアドバイスをもらった  

`.gitignore_global` このようなファイルを作って  

```sh
$ cat ~/.gitignore_global
## Mac
.DS_Store
```

git global に設定すれば良いみたい  

```sh
## 設定
$ git config --global core.excludesfile ~/.gitignore_global

## 確認
$ git config --list | grep core.excludesfile
core.excludesfile=/Users/user/.gitignore_global
```

いろいろ調べてみると個人の環境依存ファイルを含めないプロジェクトもあれば含めるプロジェクトもあるみたい  
基本的に `core.excludesFile` で良いかなと思ったけど、いちいち説明をするのも大変だし、 `git add .` されてああ......ってなるぐらいなら `.gitignore` でも良いのかなと思ったり  
個人のものは `core.excludesFile` に持っていこう  

- 参考
  - [Ignoring files - GitHub Docs](https://help.github.com/articles/ignoring-files)
  - [プロジェクトの.gitignoreに.swpファイルなど個人環境依存のファイルは含めない | 高木のブログ](https://takagi.blog/gitignore_global/)
  - [.gitignoreに.DS_Storeなど個人環境依存のファイルを含めても良いのではないか | blog.tai2.net](https://blog.tai2.net/gitignore.html)
  - [gitignore に書くべきでないものは gitignore_global へ - Qiita](https://qiita.com/elzup/items/4c92a2abdab56db3fb4e)

