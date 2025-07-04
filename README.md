## アプリケーション名
medical(電子カルテ)

## アプリケーション概要
医療従事者が患者の電子カルテの変更履歴を管理し、誰が、いつ、どのように治療方針を変更したかを追跡できるようにする。

## テスト用アカウント
テスト用ID：222222
テスト用password：1qa2ws

## URL
https://medical-0apm.onrender.com

## 利用方法
### 診療記録を登録する
１．事前に作成したIDとパスワードでログイン

２．記録したい患者名を選択

３．「診療記録を記録する」を選択

４．必要事項を全て入力し「記録する」ボタンを押す

### 新規患者登録する
１．事前に作成したIDとパスワードでログイン

２．「新規患者登録」ボタンを押す

３．必要事項を入力

４．「登録」ボタンを押す

## アプリケーションを作成した背景
未だ紙媒体での患者情報の共有の場面に直面した。業務の効率化とサービス向上の課題を解決したいと思い、情報を共有・閲覧・登録できるアプリを開発した。

## 実装予定の機能
今後実装予定の機能
- 診療記録登録内容の細分化
- 診療記録の定型文
- 各職種の操作専用タブ機能
- 用語解説機能

## 開発環境
| 項目                | バージョン・サービス  |
|---------------------|---------------------|
| **言語**            | Ruby 3.2.0          |
| **フレームワーク**   | Ruby on Rails 7.1.0 |
| **データベース**     | PostgreSQL 17.4（本番） / MySQL 8.0.10（開発） |
| **フロントエンド**   | HTML / CSS          |
| **認証機能**        | Devise 4.9.4        |
| **デプロイ環境**     | Render              |
| **バージョン管理**   | GitHub              |

## 工夫したポイント
- 小規模の医療施設をターゲット層とするため、機能を限定した。
- 見やすいデザインにした。
- 管理者権限のみユーザー登録ができるようにした。

## 今後の課題
- 未実装機能の完成