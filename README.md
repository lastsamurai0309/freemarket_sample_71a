# README

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false
|email|string|null: false, unique: true||
|password|string|null: false, unique: true||
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_fri|string|null: false|
|first_name_fri|string|null: false|
|shopping-address_id|string|foreign_key: true|
|message_id|foreign_key: true|
|rate_id|foreign_key: true|
|card_id|foreign_key: true|
### Association
- has many:items
- has many:messages
- has many:rates
- has many:cards
- has many:shopping-address
- has many:Purchase historys

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|credit_num|integer|null: false, foreign_key: true|
|limit_month|integer|null: false, foreign_key: true|
|limit_year|string|null: false|
|security|string|null: false|
|user_id|foreign_key: true|
### Association
- belongs_to :users

## shopping-addressテーブル
|Column|Type|Options|
|------|----|-------|
|address_name|string|null: false|
|address_furi|string|null: false|
|post_num|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|billding|string|
|phone_number|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|item_content|text|null: false|
|categorys_id|fnull: false, oreign_key: true|
|size_id|foreign_key: true|
|brand_id|foreign_key: true|
|condition_id|null: false, foreign_key: true|
|fee_id|null: false, foreign_key: true|
|area_id|null: false, foreign_key: true|
|shipping_day_id|null: false, foreign_key: true|
|price|integer|null: false|
|user_id|null: false, foreign_key: true|
### Association
- has many: images
- has many: comments
- belongs to: users
- belongs to: categorys
- belongs to: brand
- belongs to: size
- belongs to: condition
- belongs to: fee
- belongs to: sipping_day

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|null: false, foreign_key: true|
### Association
- belongs to: items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|categories|string|
### Association
- belongs to: items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|
### Association
- belongs to: items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|
### Association
- belongs to: items

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|area|string|
### Association
- belongs to: items

## sipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|sipping_day|string|
### Association
- belongs to: items

## feesテーブル
|Column|Type|Options|
|------|----|-------|
|fee|string|
### Association
- belongs to: items

## Purchase historysテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|foreign_key: true|
|item_id|foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :items

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|string|
### Association
- belongs to: users