#　テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | text   | null: false               |
| first_name_kana    | text   | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchased_items

## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| item_name      | string     | null: false                   |
| description    | text       | null: false                   |
| category       | integer    | null: false                   |
| condition      | integer    | null: false                   |
| delivery_payer | integer    | null: false                   |
| shipping_area  | integer    | null: false                   |
| sending_days   | integer    | null: false                   |
| price          | integer    | null: false                   |
| user           | references | null: false, foreign_key: true|

### Association

- has_one    :purchased_item
- belongs_to :user

## purchased_items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :destination

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| building_address | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchased_item   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchased_item
