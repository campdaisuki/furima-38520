# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Association

- has_many :items
- has_one :destinations
- has_one :cards

## items テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| name                   | string | null: false |
| price                  | string | null: false |
| text                   | string | null: false |
| category               | string | null: false |
| shipping_charges       | string | null: false |
| shipping_origin_region | string | null: false |
| days_to_ship           | string | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

belongs_to :user

## destinations テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| municipality       | string | null: false |
| address            | string | null: false |
| building_name      | string | null: false |
| phone_number       | string | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :cards
- belongs_to :user

## cards テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| card               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :destination
- belongs_to :user