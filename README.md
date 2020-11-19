# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_one :profile
- has_many :item
- has_many :buy


## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| kana_last_name  | string     | null: false                    |
| kana_first_name | string     | null: false                    |
| birth           | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| ship_method     | string     | null: false                    |
| shipment_source | string     | null: false                    |
| days_to_ship    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| state         | string     | null: false                    |
| city          | string     | null: false                    |
| block_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
