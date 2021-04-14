# DB設計

## Users Table

| column             | types  | options     |
| ------------------ | ------ | ----------- |
| encrypted_password | string | null: false |
| email              | string | null: false |
| username           | string | null: false |
| name               | string | null: false |

### Association

has_many :posts

## Posts Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| title     | string     | null: false       |
| content   | text       | null: false       |
| address   | string     | null: false       |
| latitude  | float      |                   |
| longitude | float      |                   |
| user   | references | foreign_key: true |

### Association

belongs_to :user
has_many :post_statuses
has_many :statuses, through: :post_statuses
has_many :post_continents
has_many :continents, through: :post_continents

## Post_statuses Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| post   | references | foreign_key: true |
| status | references | foreign_key: true |

### Association

belongs_to :post
belongs_to :status

## Statuses Table

| column    | types   | options     |
| --------- | ------- | ----------- |
| area_id   | integer | null: false |
| danger_id | integer | null: false |

### Association

has_many :post_statuses
has_many :posts, through: :post_statuses

## Post_continents Table

| column    | types      | options           |
| --------- | ---------- | ----------------- |
| post      | references | foreign_key: true |
| continent | references | foreign_key: true |

### Association

belongs_to :post
belongs_to :continent

## Continents Table

| column       | types   | options |
| ------------ | ------- | ------- |
| asia_id      | integer |         |
| oceania      | integer |         |
| europe       | integer |         |
| middleeast   | integer |         |
| africa       | integer |         |
| northamerica | integer |         |
| southamerica | integer |         |

### Association

has_many :post_continents
has_many :posts, through: :post_continents