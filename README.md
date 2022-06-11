# 365

[![Netlify Status](https://api.netlify.com/api/v1/badges/6d76594c-84e3-4e7f-ae75-347ffe66747f/deploy-status)](https://app.netlify.com/sites/honyanya-365/deploys)  


## Description

「書き続ける」が目的のリポジトリ  
いずれは 365 日分の記事があるようにしたい  


## Contents

https://365.honyanya.com/  

過去記事  

- [2021](./2021/README.md)
  - [2021/05](./2021/05/README.md)
  - [2021/06](./2021/06/README.md)
  - [2021/07](./2021/07/README.md)
  - [2021/08](./2021/08/README.md)

TODO: 過去記事は少しずつ Gaysby 側に入れる予定  
![#146](https://github.com/honyanya/365/issues/146)  


## Tips

textlint  

```sh
$ yarn lint

$ yarn lint:fix
```

執筆用のスクリプト  

```sh
## change env
$ cp ./.env.sample ./.env
$ vim ./.env
$ cd scripts/

## start
$ ./article-start.sh

## writing...

## end
$ ./article-end.sh
```
