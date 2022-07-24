---
title: "今海外に居るので whois で場所を見てみる"
date: "2022-07-22T23:59:59.999"
---

引き続きモンゴル旅行のタイミングなので、やってみる  
今回は滞在先の IP アドレスを調べて whois の Country の項目を見て場所を見てみる

IP アドレスを調べて、いろいろ使いたいので変数に入れておく

```sh
$ curl https://ifconfig.me/
66.181.174.90

$ IPADDR=$(curl https://ifconfig.me/ -s)
echo $IPADDR
66.181.174.90
```

whois から Country の項目を抽出した  
`MN` が確認できる

```sh
whois $IPADDR | grep -i country
Country:        AU
country:        MN
country:        MN
country:        ZZ
country:        MN
country:        MN
```

`AU` は `OrgName: Asia Pacific Network Information Centre` となっており、 `ZZ` は  `role: ABUSE UNIVISIONLLCMN` となっていた


## 参考

- [IPアドレスからWHOISの国コード,組織を一覧するワンライナー | Oji-Cloud](https://oji-cloud.net/2020/10/08/post-5607/)
