## Usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| family_name_kanji  | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | string | null: false |


### Association
（ここに追記していく）

## Itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | string     | null: false                    |
| category           | string     | null: false                    |
| price              | string     | null: false                    |
| delivery_fee       | string     | null: false                    | 
| content            | string     | null: false                    | 
| status             | string     | null: false                    |   
| shippping_area     | string     | null: false                    | 
| shipping_days      | string     | null: false                    |
| image              | string     | null: false                    |


### Association

## Buy_itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |
| category           | references | null: false, foreign_key: true |
| price              | references | null: false, foreign_key: true |
| delivery_fee       | references | null: false, foreign_key: true |


### Association

## Buy_infoテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| municipality       | string | null: false |
| address            | string | null: false |
| building           | string |             |
| tel                | string | null: false |

### Association
