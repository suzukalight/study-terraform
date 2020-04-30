# 権限管理

## ポリシー

権限はポリシーで定義する。

### ポリシードキュメント

ポリシーはポリシードキュメントで記述する；

- Effect: allow/deny
- Action: なんのサービスで、どんな操作ができるか
- Resource: 操作可能なリソースはなにか

### IAM ポリシー

ポリシードキュメントを保持するリソース。ポリシー名とポリシードキュメントを設定する。

## ロール

### 信頼ポリシー

自身を何のサービスに関連付けるかを宣言するもの

### IAM ロール

信頼ポリシーとロール名を指定

### IAM ポリシーのアタッチ

IAM ロールに IAM ポリシーをアタッチ

### IAM ロールのモジュール化

- name: IAM ロールと IAM ポリシーの名前
- policy: ポリシードキュメント
- idnetifier: IAM ロールを関連付ける AWS サービスの識別子