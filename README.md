## Usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name_kanji   | string | null: false  | 
| family_name_kanji  | string | null: false  |
| first_name_kana    | string | null: false  | 
| family_name_kana   | string | null: false  |
| birthday           | date   | null: false  | 


### Association
- has_many :Items
- has_many :Buy_items

## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | string     | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_fee       | string     | null: false                    | 
| content            | text       | null: false                    | 
| status_id          | string     | null: false                    |   
| sprefecture_id     | integer    | null: false                    | 
| shipping_days_id   | integer    | null: false                    |



### Association
- belongs_to :Users
- has_one :Buy_items

## Buy_itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association
- belongs_to :Users
- belongs_to :Items
- has_one :Buy_info

## Buy_infoテーブル

| Column             | Type    | Options        |
| ------------------ | ------- | -------------- |
| postal_code        | string  | null: false    |
| prefecture_id      | integer | null: false    |
| municipality       | string  | null: false    |
| address            | string  | null: false    |
| building           | string  | optional: true |
| tel                | string  | null: false    |

### Association
- belongs_to :Buy_items
