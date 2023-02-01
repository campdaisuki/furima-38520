# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false  |
| family_name        | string | null: false  |
| first_name         | string | null: false  |
| family_name_kana   | string | null: false  |
| first_name_kana    | string | null: false  |
| birth_day          | date   | null: false  |


### Association

- has_many :items
- has_one :destinations
- has_one :purchase_historys

## items テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| name                   | string | null: false |
| price                  | integer | null: false |
| text                   | text | null: false |
| category_id               | integer | null: false |
| shipping_charges_id       | integer | null: false |
| shipping_origin_region_id | integer | null: false |
| prefecture_id         | integer | null: false |
| days_to_ship_id           | integer | null: false |
| user                   | references | null: false, foreign_key: true |
| purchase_history       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_historys

## destinations テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture_id         | integer | null: false |
| municipality       | string | null: false |
| address            | string | null: false |
| building_name      | string |
| phone_number       | string | null: false |
| card               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_historys

## cards テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| card               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## purchase_historys テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :destination
- belongs_to :user
- belongs_to :item
