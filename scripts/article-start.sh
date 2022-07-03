#!/usr/bin/env bash

## 環境変数の設定
## export KEY=value

## 環境変数の読込
. ./../.env

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
git switch -c ${GITHUB_FEATURE_BRANCH} origin/${GITHUB_FEATURE_BRANCH}
git commit --allow-empty -m "${GITHUB_PR_TITLE}"
git push origin ${GITHUB_FEATURE_BRANCH}

## PR の作成
curl -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPOSITORY}/pulls" \
  -d "{\"title\": \"${GITHUB_PR_TITLE}\", \"body\": \"${GITHUB_PR_DESCRIPTION}\", \"head\": \"${GITHUB_USER}:${GITHUB_FEATURE_BRANCH}\", \"base\": \"${GITHUB_BASE_BRANCH}\"}"
