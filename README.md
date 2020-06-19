# README

## user_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|integer|null: false|
|password|integer|null: false|
|nickname|string|null: false|

### Association
- has_many :group_users
- has_many :tag_users
- has_many :groups, through: :group_users
- has_many :tags, through: :tag_users
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :group_users
- has_many :tag-groups
- has_many :users, through: :group_users
- has_many :tags, through: :tag-groups
- has_many :messages

## tag_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tag
- belongs_to :user

## tag_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :tag
- belongs_to :group

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|

### Association
- has_many :tag_users
- has_many :tag_groups
- has_many :users, through: :tag_users
- has_many :groups, through: :tag_groups

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
