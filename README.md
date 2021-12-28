# テーブル設計

## users テーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false, UNIQUE: true|
| encrypted_password | string     | null: false              |
| last_name          | string     | null: false              |
| fist_name          | string     | null: false              |
| last_name_kana     | string     | null: false              |
| first_name_kana    | string     | null: false              |
| birthday           | date       | null:false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| description   | text        | null: false                    |
| category_id   | integer     | null: false                    |
| status_id     | integer     | null: false                    |
| shipping_id   | integer     | null: false                    |
| prefecture_id | integer     | null: false                    |
| schedule_id   | integer     | null: false                    |
| price         | integer     | null:false                     |
| user          | references  | null:false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :order