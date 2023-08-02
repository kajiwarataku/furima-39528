# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_katakana | string | null: false               |
| first_name_katakana| string | null: false               |
| nickname           | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
| category           | integer    |null: false                    |
| condition          | integer    | null: false                    |
| bear               | integer    | null: false                    |
| area               | integer    | null: false                    |
| day                | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user


## purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addres


## addressテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code          | string    | null: false                    |
| area               | integer   | null: false                    |
| municipality       | string    | null: false                    |
| house_number       | string    | null: false                    |
| building_name      | string    |                                |
| telephone_number   | string    | null: false, foreign_key: true |
| purchase           | references| null: false, foreign_key: true |

### Association
- belongs_to :purchase
 