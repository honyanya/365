---
title: "メモ ndjson"
date: "2022-10-10T23:59:59.000"
description: "ndjson について教えてもらったのでメモ"
---

ndjson について教えてもらったのでメモ  
[ndjson](http://ndjson.org/) は Newline Delimited JSON の略

通常の JSON

```json
[{"id": "1", "name": "hoge", "other": "Widder"},{"id": "2", "name": "fuga", "other": "Stier"},{"id": "3", "name": "piyo", "other": "Zwillinge"}]
```

ndjson  
見てわかる通り行ごとに JSON がある  
１行ごとに処理をする（fluentd や Elasticsearch など）

```json
{"id": "1", "name": "hoge", "other": "Widder"}
{"id": "2", "name": "fuga", "other": "Stier"}
{"id": "3", "name": "piyo", "other": "Zwillinge"}
```
