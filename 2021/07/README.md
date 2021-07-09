# 2021/07

<!-- TOC -->

- [2021/07](#202107)
    - [2021/07/01 Thu](#20210701-thu)
    - [2021/07/02 Fri](#20210702-fri)
    - [2021/07/03 Sat](#20210703-sat)
    - [2021/07/04 Sun](#20210704-sun)
    - [2021/07/05 Mon](#20210705-mon)
    - [2021/07/06 Tue](#20210706-tue)
    - [2021/07/07 Wed](#20210707-wed)
    - [2021/07/08 Thu](#20210708-thu)
    - [2021/07/09 Fri](#20210709-fri)

<!-- /TOC -->


## 2021/07/01 Thu

Python でテストをやってみる  

前に Python でスクリプトを書いてみたので、テストコードを書くことにしてみた  
シンプルに "hello world!" と出力されているかをテストで書いてみる  

こんなスクリプトを用意して  

`helloworld.py`

```py
#!/usr/bin/env python
# -*- coding: utf-8 -*-

def main():
    message = helloWorld()
    print(message)

def helloWorld():
    return 'hello world!'

if __name__ == "__main__":
    main()
```

実行するとこんな感じ  

```sh
$ python ./helloworld.py
hello world!
```

テストを書いてみる  
`unittest` を使用してこんな感じに書く  

`test_hellowold.py`

```py
#!/usr/bin/env python
# -*- coding: utf-8 -*-
import unittest
from helloworld import helloWorld

class TestHelloWorld(unittest.TestCase):

    def test_helloWorld(self):
        expected = 'hello world!'
        actual = helloWorld()

        self.assertEqual(expected, actual)

if __name__ == "__main__":
    unittest.main()
```

テストを実行するとこんな感じ  

```sh
$ python ./test_helloworld.py 
.
----------------------------------------------------------------------
Ran 1 test in 0.000s
```

- 参考
  - [Python標準のunittestの使い方メモ - Qiita](https://qiita.com/aomidro/items/3e3449fde924893f18ca)
  - [最短で試すPythonテストコード - Qiita](https://qiita.com/phorizon20/items/acb929772aaae4f52101)


## 2021/07/02 Fri

jq コマンドで出力した結果のダブルクォーテーションを外す  

こんな JSON があって  

```json
{
  "key1": "value1",
  "key2": "value2",
  "key3": "value3"
}
```

こんな感じで値を取得する  

```sh
$ cat ./sample.json | jq '.key2'
"value2"
```

このダブルクォーテーションを外して、別の処理に渡したい  
sed でダブルクォーテーションを空文字に変換することもできるけど  

```sh
$ cat ./sample.json | jq '.key2' | sed 's/"//g'
value2
```

jq には -r オプションがあるのでそちらを使うと OK  

```sh
$ cat ./sample.json | jq -r '.key2'
value2
```

- 参考
  - [jq コマンドを使う日常のご紹介 - Qiita](https://qiita.com/takeshinoda@github/items/2dec7a72930ec1f658af)


## 2021/07/03 Sat

GitHub API で PR 作成  

1 ヶ月以上手動で作成していたが、せっかくなので GitHub API 経由で PR を作成してみることにした  

まずは Token の設定を変更する  
[Personal Access Tokens](https://github.com/settings/tokens) にアクセスして `public_repo` にチェックを入れた  

こんな感じで環境変数を用意して  

```sh
export GITHUB_TOKEN=
export GITHUB_USER=
export GITHUB_REPOSITORY=
export GITHUB_FEATURE_BRANCH=
export GITHUB_PR_TITLE=
```

curl で叩けば OK  

```sh
curl -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/$GITHUB_USER/$GITHUB_REPOSITORY/pulls" \
  -d "{\"title\": \"$GITHUB_PR_TITLE\", \"head\": \"$GITHUB_USER:$GITHUB_FEATURE_BRANCH\", \"base\": \"main\"}"
```

push 後にタイトルとかは修正するが、本日分の PR は API で作成を行った  
https://github.com/honyanya/365/pull/63  

- 参考
  - [github で自分のリポジトリに pull request を投げたい - げっとシステムログ](https://www.getto.systems/entry/2016/04/20/192727)


## 2021/07/04 Sun

GitHub API でブランチ作成  

昨日の続き  
今日は branch を GitHub API で作成する  

まずはこんな感じでリビジョンハッシュを取得する  

```sh
curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs/heads/${BASE_BRANCH}" -s \
  | jq -r '.[].object.sha'
```

がこの方法だとブランチの数だけリビジョンハッシュが出力されてしまう  
なので jq をちょこっとだけ修正して、 main ブランチのリビジョンハッシュを取得できるようにする  

```sh
curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs/heads/${BASE_BRANCH}" -s \
  | jq -r '.[] | select(.ref == "refs/heads/main") | .object.sha'
```

このあとの処理でこのリビジョンハッシュは使うため、変数として用意しておく  

```sh
github_hash=$(curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs/heads/${BASE_BRANCH}" -s \
  | jq -r '.[] | select(.ref == "refs/heads/main") | .object.sha')

echo $github_hash
```

準備は完了  
下記のように API を叩くことでブランチが作成できる

```sh
curl -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -d "{\"ref\": \"refs/heads/${GITHUB_FEATURE_BRANCH}\", \"sha\":\"${github_hash}\"}" \
  https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs
```

- 参考
  - [GitHub APIを使ってブランチを新規作成する - ぷらすのブログ](https://blog.p1ass.com/posts/create-branch-using-github-api/)


## 2021/07/05 Mon

GitHub API を使って、 GitHub の画面を触らずに執筆ができる状態にした  

昨日の続き  
昨日までの内容を元にスクリプトを繋ぎ合わせてみた  
これでブランチ作成や PR 作成もブラウザを使わずに作成できることが可能になった  
執筆開始までのリードタイム削減に繋がった  

```sh
## 環境変数の設定（未入力値は設定する）
export GITHUB_TOKEN=
export GITHUB_USER=
export GITHUB_REPOSITORY=
export GITHUB_BASE_BRANCH=main
export GITHUB_FEATURE_BRANCH="feature/add_$(date "+%Y-%m-%d")"
export GITHUB_PR_TITLE=
export GITHUB_PR_DESCRIPTION="$(date "+%Y/%m/%d") 分"

## リビジョンハッシュの取得
github_hash=$(curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs/heads/${BASE_BRANCH}" -s \
  | jq -r '.[] | select(.ref == "refs/heads/main") | .object.sha')

## リモートブランチの作成
curl -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -d "{\"ref\": \"refs/heads/${GITHUB_FEATURE_BRANCH}\", \"sha\":\"${github_hash}\"}" \
  https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/git/refs

## ローカルブランチを作成し、空コミットをプッシュする
git fetch origin
git checkout -b ${GITHUB_FEATURE_BRANCH} origin/${GITHUB_FEATURE_BRANCH}
git commit --allow-empty -m "${GITHUB_PR_TITLE}"
git push origin ${GITHUB_FEATURE_BRANCH}

## PR の作成
curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/pulls" \
  -d "{\"title\": \"${GITHUB_PR_TITLE}\", \"body\": \"${GITHUB_PR_DESCRIPTION}\", \"head\": \"${GITHUB_USER}:${GITHUB_FEATURE_BRANCH}\", \"base\": \"${GITHUB_BASE_BRANCH}\"}"
```

同期から CLI ツール触ってみたら？という提案が合ったので明日はそれを触ろうかな  


## 2021/07/06 Tue

GitHub CLI を触る  

昨日の続き  
昨日までは GitHub API でブランチなどを作成していたが今日からは [GitHub CLI](https://cli.github.com/) を触ってみることにする  

インストール  
homebrew でインストールをした  

```sh
$ brew install gh

$ gh --version
gh version 1.12.1 (2021-07-01)
https://github.com/cli/cli/releases/tag/v1.12.1
```

まずは GitHub CLI でログインする  

```sh
$ gh auth login
```

Github.com や SSH などを選択して進める  
Token を入力すると下記エラーが出た  

```sh
? Paste your authentication token:
error validating token: missing required scopes 'repo', 'read:org'
```

Token の権限が足りていないため、[Personal Access Tokens](https://github.com/settings/tokens) から足りていない権限を追加を行う  
再度実行して、 Token 入力後も問題無く通過した  

```sh
$ gh auth login
...
insufficient OAuth scopes
```

GitHub CLI が使えるようになったので動作確認でこのリポジトリの README を見てみる  

```sh
$ gh repo view honyanya/365
```

`gh repo view [repository]` で見れる  

- 参考
  - [GitHub CLI 1.0 がリリースされたので一通り触ってみる - michimani.net](https://michimani.net/post/development-get-started-to-use-github-cli/)


## 2021/07/07 Wed

GitHub CLI で PR を作成する  

非常に簡単にできた  
リモートブランチ作成までは作成と空コミットを行って GitHub CLI のコマンドを実行する  

カレントブランチが PR を作成したいブランチであることを確認する  

```sh
$ git branch
* feature/add_2021-07-07
  feature/add_ssg
  main
```

`gh pr create` で作成ができる  
Title, Body を入力すれば完了する  

```sh
$ gh pr create

Creating pull request for feature/add_2021-07-07 into main in honyanya/365

? Title #67
? Body <Received>
? What's next? Submit
https://github.com/honyanya/365/pull/67
```


## 2021/07/08 Thu

GitHub CLI での入力を nano から vim にする  

デフォルトだと nano が選択されてしまう  

```sh
$ gh pr create

Creating pull request for feature/add_2021-07-08 into main in honyanya/365

? Title #68
? Body [(e) to launch nano, enter to skip]
```

`EDITOR=vim` を設定すれば vim で入力することが可能になる  

```sh
$ export EDITOR=vim
$ printenv EDITOR
vim
```

`(e) to launch nano` から `(e) to launch vim` になっている  

```sh
$ gh pr create

Creating pull request for feature/add_2021-07-08 into main in honyanya/365

? Title #68
? Body [(e) to launch vim, enter to skip] 
```

実行時に `EDITOR=vim` を指定しても OK  

```sh
$ EDITOR=vim gh pr create

Creating pull request for feature/add_2021-07-08 into main in honyanya/365

? Title #68
? Body [(e) to launch vim, enter to skip] 
```

- 参考
  - [Ability to configure a default editor for use with `gh` · Issue #308 · cli/cli](https://github.com/cli/cli/issues/308)


## 2021/07/09 Fri

365 で使う GitHub CLI の操作  

昨日は PR を作ったので、他の操作も行ってみる  

PR の編集  

`gh pr edit [PR number]` で実行できる  
`--title` でタイトルの変更  
`--add-assignee` で担当者の追加

```
## タイトルの変更
$ gh pr edit 68 --title "feature/add_2021-07-08][add] GitHub CLI での入力を nano から vim にする"
https://github.com/honyanya/365/pull/68

## 担当者の変更
$ gh pr edit 68 --add-assignee @me
https://github.com/honyanya/365/pull/68
```

PR のマージ  
`gh pr merge [PR number]` で実行できる

```
$ gh pr merge 68
? What merge method would you like to use? Create a merge commit
? Delete the branch locally and on GitHub? Yes
? What's next? Submit
✓ Merged pull request #68 (feature/add_2021-07-08][add] GitHub CLI での入力を nano から vim にする)
✓ Deleted branch feature/add_2021-07-08 and switched to branch main
```

- 参考
  - 公式
    - [gh pr edit | GitHub CLI](https://cli.github.com/manual/gh_pr_edit)
    - [gh pr merge | GitHub CLI](https://cli.github.com/manual/gh_pr_merge)

