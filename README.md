## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_kanji   | string | null: false               | 
| family_name_kanji  | string | null: false               |
| first_name_kana    | string | null: false               | 
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               | 


### Association
- has_many :items
- has_many :buy_items

## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | string     | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    | 
| content            | text       | null: false                    | 
| status_id          | integer    | null: false                    | 
| prefecture_id      | integer    | null: false                    | 
| shipping_days_id   | integer    | null: false                    |



### Association
- belongs_to :user
- has_one :buy_item

## Buy_itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :buy_info

## Buy_infoテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| buy_item           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy_item
