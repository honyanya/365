#!/usr/bin/env bash

## 差分確認
git diff
git status

git checkout main

## ローカルリポジトリを最新の状態にする
git fetch origin
git merge origin/main

## ローカル、リモートともに不必要なブランチを削除する
git branch | grep feature | xargs git branch -d
git fetch origin -p
