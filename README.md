# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| nickname           | string | null: false               |
| birth_date         | string | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| name               | string | null: false                    |
| description        | string | null: false                    |
| category           | string | null: false                    |
| condition          | string | null: false                    |
| bear               | string | null: false                    |
| area               | string | null: false                    |
| days               | string | null: false                    |
| price              | string | null: false                    |
| user               | string | null: false, foreign_key: true |

### Association
- has_one :purchases
- belongs_to :users


## purchasesテーブル
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| item               | string | null: false, foreign_key: true |
| user               | string | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :address


## addressテーブル
| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| post_code          | string | null: false                    |
| prefectures        | string | null: false                    |
| municipality       | string | null: false                    |
| house_number       | string | null: false                    |
| building_name      | string | null: false                    |
| telephone_number   | string | null: false                    |

### Association
- belongs_to :purchases
