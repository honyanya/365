---
title: "Cloudflare Workers のランタイム workerd で Hello World"
date: "2022-09-30T23:59:59.000"
description: "Cloudflare Workers のランタイム workerd が出たので Hello World をやってみる"
---

Cloudflare Workers のランタイム workerd が出たので Hello World をやってみる  
https://github.com/cloudflare/workerd


## やってみる

プロジェクトを作成して、 workerd を入れる

```sh
$ yarn init -y
$ yarn add -D workerd
```

Hello World を返すスクリプト `hello.js` を作成

```js
addEventListener("fetch", event => {
    event.respondWith(new Response("Hello World"));
});
```

設定 `config.capnp` を作成  
中で `hello.js` を指定する

```js
using Workerd = import "/workerd/workerd.capnp";

const config :Workerd.Config = (
  services = [
    (name = "main", worker = .mainWorker),
  ],

  sockets = [
    # Serve HTTP on port 8080.
    ( name = "http",
      address = "*:8080",
      http = (),
      service = "main"
    ),
  ]
);

const mainWorker :Workerd.Worker = (
  serviceWorkerScript = embed "src/hello.js",
  compatibilityDate = "2022-09-16",
);
```

動かしてみる

```sh
$ yarn workerd serve config.capnp

## other terminal
$ curl -XGET http://localhost:8080/
Hello World
```


## Hono でやってみる

実は先にこっちで試してた  
流れはだいたい同じ

プロジェクトを作成して、 workerd と hono を入れる

```sh
$ yarn init -y
$ yarn add -D workerd
$ yarn add hono
```

Hono を使った `src/index.ts` を作成  

```ts
import { Hono } from "hono";

const app = new Hono();

app.get("/", (c) => c.text("Hello workerd"));

export default app;
```

JavaScript で動かすので esbuild を実行

```sh
$ yarn esbuild --bundle --format=esm --outfile=dist/worker.mjs src/index.ts
```

設定 `config.capnp` を作成

```ts
using Workerd = import "/workerd/workerd.capnp";

const config :Workerd.Config = (
	services = [
		(name = "main", worker = .mainWorker),
	],

	sockets = [
		# Serve HTTP on port 8080.
		( name = "http",
			address = "*:8080",
			http = (),
			service = "main"
		),
	]
);

const mainWorker :Workerd.Worker = (
	compatibilityDate = "2022-09-17",

	modules = [
		( name = "dist/worker.mjs", esModule = embed "dist/worker.mjs" ),
	]
);
```

動かしてみる

```sh
$ yarn workerd serve config.capnp

## other terminal
$ curl -XGET http://localhost:8080/
Hello workerd
```


## 参考

- [Cloudflare Workersのランタイム「workerd」を触ってみた - ゆーすけべー日記](https://yusukebe.com/posts/2022/workerd/)
