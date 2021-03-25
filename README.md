# README

## users テーブル
｜Column            |type   |options     |
｜---------------------------------------|
｜nickname          |string |null: false,|
｜email             |string |null: false,|
｜encrypted_password|integer|null: false,|
｜last_name         |string |null: false,|
｜first_name        |string |null: false,|
｜last_name_kana    |string |null: false,|
｜first_name_kana   |string |null: false,|
｜birthday          |date   |null: false,|

## Association
- has_many :items
- has_many :purchase_records

## items テーブル
|Column              |type      |options             |
|----------------------------------------------------|
|seller                 |string    |null: false,     |
|category_id            |integer   |null: false,     |
|status_id              |integer   |null: false,     |
|delivery_fee_id        |integer   |null: false,     |
|shipping_area_id       |integer   |null: false,     |
|ship_date_id           |integer   |null: false,     |
|price                  |integer   |null: false,     |
|description            |text      |null: false,     |
|product_name           |string    |null: false,     |
|user                   |references|foreign_key: true|

## Association
- belongs_to :user
- has_many :purchase_records

## profiles テーブル
|Column            |type      |options          |
|-----------------------------------------------|
|postal_code       |string    |null: false      |
|prefectures       |integer   |null: false      |
|municipality      |string    |null: false      |
|address           |string    |null: false      |
|building_name     |string    |                 |
|phone_number      |integer   |null: false      |
|purchase_record_id|references|foreign_key: true|

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
