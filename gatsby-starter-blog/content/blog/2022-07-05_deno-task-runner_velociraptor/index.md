---
title: "Deno タスクランナーに Velociraptor を入れる"
date: "2022-07-05T23:59:59.999"
---

主に `deno.json` の書き方
Deno Task Runner に Git Hooks を入れたいが対応していないため、 Velociraptor を使って対応することにした  

Velociraptor の[ドキュメント](https://velociraptor.run/docs/configuration/#configuration)に書いてあるとおり、 `velociraptor` キーを書けば認識する

```json
{
  "tasks": {
    "check": "deno lint && deno fmt --check"
  },
  "velociraptor": {
    "scripts": {
      "check": "deno fmt --check && deno lint",
      "pre-commit": {
        "cmd": [
          "vr check"
        ],
        "gitHook": "pre-commit"
      }
    }
}
```
