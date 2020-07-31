# README

## アプリ名
チャットch

## 概要
### 初個人開発のチャットアプリ
主な機能： <br>
* ユーザー登録/編集　（アバター画像追加可能） <br>
* チャットグループの作成/編集/削除<br>
* 全体公開チャットの作成/編集/削除/タグ付け　（各チャット毎のメイン画像追加可能） <br>
* 各チャットグループへのコメント投稿/削除　（非同期通信対応） <br>
* 全体公開チャットの検索

## 本番環境
デプロイ先：　URL　http://54.150.76.116/<br>
テストアカウント： <br>
ユーザー名 guest<br>
e-mail　guest@mail.com<br>
Pass　guest000

## 制作背景
営業職からITエンジニアに転職することを目指して、プログラミング学習を始めて最初に作ったアプリです。<br>
駆け出しエンジニアを目指している今、私に必要なのは学習、実践、コミュニティー拡大。<br>
知識や経験が少ないため、人との繋がりが大切と考えました。<br>
今やTwitterやFaceBook、Lineなどコミュニティーを広げるためのアプリを日常的に利用していますが、<br>
利用しているアプリの機能はどのように実装されているのかという視点で、学習したことの応用として実装しました。

## DEMO
![demo1](app/assets/images/promo1.png)
![demo2](app/assets/images/promo2.png)
![demo3](app/assets/images/promo3.png)

## 工夫したポイント
全体公開チャットは2ch等の掲示板を意識していますが、キーワードやタイトルだけで記事の魅力を伝えるよりも、<br>
記事に関連する特徴的な画像をピックアップ画面としてトップページに表示することで、利用者に魅力が伝わりやすく、見た目も華やかになると思い実装しました。<br>
同様の観点からユーザーのアバター画像も付けました。

## 使用技術（開発環境）
Ruby/Ruby on Rails/JavaScript/jQuery/MySQL/Github/AWS/Visual Studio Code <br>
* Ruby 2.6.5 <br>
* gem 'acts-as-taggable-on'

## 今後実装したい機能
* 検索機能の拡張<br>
* 動画の投稿<br>
* 見た目を格好良くJavaScriptで装飾する<br>
* リファクタリング（DRY原則）

## DB設計

### user_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|integer|null: false|
|password|integer|null: false|
|name|string|null: false|
|password confirmation|integer|null: false|
|image|text|

#### Association
- has_many :group_users
- has_many :tag_users
- has_many :groups, through: :group_users
- has_many :tags, through: :tag_users
- has_many :messages

### groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### Association
- has_many :group_users
- has_many :tag-groups
- has_many :users, through: :group_users
- has_many :tags, through: :tag-groups
- has_many :messages

### messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user

### all_users_chatsテーブル


    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["name"], name: "index_all_users_chats_on_name", unique: true
    t.index ["user_id"], name: "index_all_users_chats_on_user_id"
  end
  
### commentsテーブル
    t.string "content"
    t.string "image"
    t.bigint "user_id"
    t.bigint "all_users_chat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["all_users_chat_id"], name: "index_comments_on_all_users_chat_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

### tag_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :tag
- belongs_to :user

### tag_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :tag
- belongs_to :group

### tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|

#### Association
- has_many :tag_users
- has_many :tag_groups
- has_many :users, through: :tag_users
- has_many :groups, through: :tag_groups
