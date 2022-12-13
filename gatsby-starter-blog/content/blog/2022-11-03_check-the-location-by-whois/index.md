---
title: "イタリアでも whois で調べてみる"
date: "2022-11-03T23:59:59.000"
description: "モンゴルでもやった whois をイタリアでもやってみる"
---

モンゴルでもやった whois をイタリアでもやってみる  
滞在先のホテルでやってみた

実行してみると US だった

```sh
$ IPADDR=$(curl https://ifconfig.me/ -s)

$ echo $IPADDR
47.53.107.176

$ whois $IPADDR | grep -i country
Country:        US
```

詳細も見ると ARIN(American Registry for Internet Numbers) となっている  
ヨーロッパは RIPE NCC(Réseaux IP Européens Network Coordination Centre) になりそうだけど「？」となってしまった

```sh
$ whois $IPADDR
% IANA WHOIS server
% for more information on IANA, visit http://www.iana.org
% This query returned 1 object

refer:        whois.arin.net

inetnum:      47.0.0.0 - 47.255.255.255
organisation: Administered by ARIN
status:       LEGACY

whois:        whois.arin.net

changed:      1991-01
source:       IANA

# whois.arin.net

NetRange:       47.53.0.0 - 47.53.255.255
CIDR:           47.53.0.0/16
NetName:        VODAFONE-IP-SERVICE
NetHandle:      NET-47-53-0-0-1
Parent:         NET47 (NET-47-0-0-0-0)
NetType:        Direct Allocation
OriginAS:
Organization:   Vodafone US Inc. (VGE-3)
RegDate:        2012-05-15
Updated:        2014-03-24
Ref:            https://rdap.arin.net/registry/ip/47.53.0.0

...
```

モバイル Wi-Fi 経由でも叩いて結果の差分を見ておけばと後悔している
