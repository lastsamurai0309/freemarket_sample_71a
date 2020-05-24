# README

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_fri|string|null: false|
|first_name_fri|string|null: false|
### Association
- has_many:items, dependent: :destroy
- has_many:messages, dependent: :destroy
- has_many:rates, dependent: :destroy
- has_many:cards, dependent: :destroy
- has_many:shopping_address, dependent: :destroy
- has_many:Purchase_historys, dependent: :destroy

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|credit_num|integer|null: false|
|limit_month|integer|null: false|
|limit_year|string|null: false|
|security|string|null: false|
|user_id|string|foreign_key: true|
### Association
- belongs_to :user

## shopping_addressテーブル
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
|categories|references|null: false, foreign_key: true|
|size|references|foreign_key: true|
|brand|references|foreign_key: true|
|condition|references|null: false, foreign_key: true|
|fee|references|null: false, foreign_key: true|
|area|references|null: false, foreign_key: true|
|shipping_day|references|null: false, foreign_key: true|
|price|references|null: false|
|user|references|null: false, foreign_key: true|
### Association
- has_many: images
- has_many: comments
- belongs_to: user
- belongs_to: category
- belongs_to: brand
- belongs_to: size
- belongs_to: condition
- belongs_to: fee
- belongs_to: sipping_day

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|null: false, foreign_key: true|
### Association
- belongs_to: item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|
### Association
- belongs_to: items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|
### Association
- belongs_to: items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|
### Association
- belongs_to: items

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|area|string|
### Association
- belongs_to: items

## sipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|sipping_day|string|
### Association
- belongs_to: item

## feesテーブル
|Column|Type|Options|
|------|----|-------|
|fee|string|
### Association
- belongs_to: item

## Purchase_historysテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|foreign_key: true|
|item_id|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|string|
### Association
- belongs_to: user