---
title: "zio-http.g8 を修正した"
date: "2022-05-04T23:59:59.999"
---

初めてコントリビュートしたのでその記録。

https://github.com/dream11/zio-http.g8/pull/7


## きっかけ

個人の開発で何を使って開発しようかなと悩んでいたのでいろいろ触っていた。  
[ZIO](https://github.com/zio/zio) 理解を深めるために [zio-http](https://github.com/dream11/zio-http) も良いなと考えていた

g8 テンプレートを使ってプロジェクトを作成した。
名前やパッケージは変更を行った。

```sh
$ sbt new dream11/zio-http.g8

name [ZHTTP Service]: zio-http-hello-world
organisation [com.example]: com.example.hogefuga
package [com.example.hogefuga.ziohttphelloworld]:
version [1.0.0]:
sbtVersion [1.6.1]:
scalaVersion [2.13.8]:
zioTestVersion [1.0.13]:
scalaFmtVersion [3.0.7]:
scalafixVersion [0.9.34]:
sbtNativePackager [1.9.7]:
sbtRevolverVersion [0.9.1]:
zhttpVersion [1.0.0.0-RC24]:
scalaFmtPluginVersion [2.4.6]:
organizeImportsVersion [0.6.0]:

Template applied in /home/vagrant/workspace/tmp/./zio-http-hello-world

```

Hello World をしようと試すがそもそも起動ができなかった。

```sh
$ sbt
> reStart
[info] Application root not yet started
[info] Starting application root in the background ...
root Starting com.example.zhttpservice.ZhttpService.main()
[success] Total time: 0 s, completed May 4, 2022, 11:36:04 AM
root[ERROR] Error: Could not find or load main class com.example.zhttpservice.ZhttpService
root[ERROR] Caused by: java.lang.ClassNotFoundException: com.example.zhttpservice.ZhttpService
root ... finished with exit code 1
```

実際にコード見てると、 `build.sbt` のメインクラスの指定が異なり、動かないコードになっていた。


```diff
-    Compile / run / mainClass := Option("com.example.zhttpservice.ZhttpService"),
+    Compile / run / mainClass := Option("com.example.ziohttphelloworld.Ziohttphelloworld"),
```

名前などを変えずに作ると起動することができた。

```sh
$ sbt new file:///home/vagrant/workspace/tmp/zio-http.g8

name [ZHTTP Service]:
organisation [com.example]:
package [com.example.zhttpservice]:
version [1.0.0]:
sbtVersion [1.6.1]:
scalaVersion [2.13.8]:
zioTestVersion [1.0.13]:
scalaFmtVersion [3.0.7]:
scalafixVersion [0.9.34]:
sbtNativePackager [1.9.7]:
sbtRevolverVersion [0.9.1]:
zhttpVersion [1.0.0.0-RC24]:
scalaFmtPluginVersion [2.4.6]:
organizeImportsVersion [0.6.0]:

Template applied in /home/vagrant/workspace/tmp/./zhttp-service

$ sbt
> reStart
[info] compiling 1 Scala source to /home/vagrant/workspace/tmp/zhttp-service/target/scala-2.13/classes ...
[info] Application root not yet started
[info] Starting application root in the background ...
root Starting com.example.zhttpservice.ZhttpService.main()
[success] Total time: 3 s, completed May 4, 2022, 10:55:23 AM
root Server started on port: 8090
```

これは OSS チャンスではないかと思ったのでじっくり見ていくことにした。


## g8 リポジトリの修正

テンプレート側である [zio-http.g8](https://github.com/dream11/zio-http.g8) を見ていくことにした。

`./src/main/g8/build.sbt` の該当部分は固定値であった。

```scala
Compile / run / mainClass := Option("com.example.zhttpservice.ZhttpService"),
```

どうやらこれを可変値にする必要がある。
他のコードに可変値があった。

```scala
ThisBuild / organization := "$organisation$"
ThisBuild / version := "$version$"
...
name := "$name$",
...
```

それを参考にメインクラスの指定が可変になるように修正することにした。

```scala
Compile / run / mainClass := Option("$package$.$name;format="word,cap"$"),
```

format の指定ができるので調整する。  
http://www.foundweekends.org/giter8/ja/formatting.html


## 動作確認

g8 はローカルのパスを指定してテンプレートを参照できるので実施。  
フォークしたリポジトリを指定して確認することもできそうだけど未確認。

```sh
$ sbt new file:///home/vagrant/workspace/tmp/zio-http.g8

name [ZHTTP Service]: zio-http-hello-world
organisation [com.example]: com.example.hogefuga
package [com.example.hogefuga.ziohttphelloworld]:
version [1.0.0]:
sbtVersion [1.6.1]:
scalaVersion [2.13.8]:
zioTestVersion [1.0.13]:
scalaFmtVersion [3.0.7]:
scalafixVersion [0.9.34]:
sbtNativePackager [1.9.7]:
sbtRevolverVersion [0.9.1]:
zhttpVersion [1.0.0.0-RC24]:
scalaFmtPluginVersion [2.4.6]:
organizeImportsVersion [0.6.0]:

Template applied in /home/vagrant/workspace/tmp/./zio-http-hello-world

$ sbt
sbt:zio-http-hello-world> reStart
[info] Application root not yet started
[info] Starting application root in the background ...
root Starting com.example.hogefuga.ziohttphelloworld.Ziohttphelloworld.main()
[success] Total time: 0 s, completed May 4, 2022, 11:39:49 AM
root Server started on port: 8090
```

動作確認できたので、修正を commit して PR に出した。

https://github.com/dream11/zio-http.g8/pull/7  
数時間後には merge されていた。

初めてコントリビュートできたのでかなりテンションが上がった。
