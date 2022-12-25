---
title: "textlint-filter-rule-comments"
date: "2022-11-07T23:59:59.000"
description: "textlint をコメントで除外できる textlint-filter-rule-comments を導入する"
---

[textlint](https://github.com/textlint/textlint) をコメントで除外できる [textlint-filter-rule-comments](https://github.com/textlint/textlint-filter-rule-comments) を導入する  
既に textlint 入れてあることが前提

yarn で textlint-filter-rule-comments 追加する

```sh
$ yarn add --dev textlint-filter-rule-comments
```

`.textlintrc` に設定を追加すれば使えるようになる

```js
{
  "filters": {
    "comments": true
  },
  "rules": {}
}
```
