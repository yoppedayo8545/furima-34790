# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nick_name             | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_kana             | string  | null: false |
| first_kana            | string  | null: false |
| date                  | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column                | Type        | Options     |
| --------------------- | ----------- | ----------- |
| name                  | string      | null: false |
| text                  | text        | null: false |
| category_id           | integer     | null: false |
| status_id             | integer     | null: false |
| delivery_fee_id       | integer     | null: false |
| prefectures_id        | integer     | null: false |
| days_to_ship_id       | integer     | null: false |
| price                 | integer     | null: false |
| user_id               | references  | null: false |

### Association

- belongs_to :user
- has_many :purchase

## purchasersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| card_num              | string  | null: false |
| expiration_month      | string  | null: false |
| expiration_year       | string  | null: false |
| security_code         | string  | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_many :address

## addressesテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code           | integer | null: false | 
| prefectures_id        | integer | null: false |
| municipality          | string  | null: false |
| address               | string  | null: false |
| building_name         | string  |             |
| phone_num             | string  | null: false |

### Association

- belongs_to :purchasers
