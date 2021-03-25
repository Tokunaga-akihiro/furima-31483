# README

## users テーブル
｜Column            |type   |options     |
｜---------------------------------------|
｜nickname          |string |null: false,|
｜email             |string |null: false,|
｜encrypted_password|integer|null: false,|
｜last_name         |string |null: false,|
｜first_name        |string |null: false,|
｜last_name(kana)   |string |null: false,|
｜first_name(kana)  |string |null: false,|
｜birthday          |string |null: false,|

## Association
- has_many :items
- has_many :purchase_records

## items テーブル
|Column              |type      |options          |
|-------------------------------------------------|
|seller              |string    |null: false,     |
|category            |integer   |null: false,     |
|status              |integer   |null: false,     |
|delivery fee        |integer   |null: false,     |
|shipping area       |integer   |null: false,     |
|ship date           |integer   |null: false,     |
|price               |integer   |null: false,     |
|description of item |text      |null: false,     |
|product name        |string    |null: false,     |
|user_id             |references|foreign_key: true|

## Association
- belongs_to :user
- has_many :purchase_records

## profiles テーブル
|Column            |type      |options          |
|-----------------------------------------------|
|postal code       |string    |null: false      |
|prefectures       |integer   |null: false      |
|municipality      |string    |null: false      |
|address           |string    |null: false      |
|building name     |string    |                 |
|phone number      |integer   |null: false      |
|purchase record_id|references|foreign_key: true|

## Association
- belongs_to :purchase_record

## purchase_records テーブル
|Column |type      |options          |
|-------|----------|-----------------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

## Association
- belongs_to :user
- belongs_to :item
