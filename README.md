#テーブル設計

##users table
|Colum             |Type   |Options                |
|------------------|-------|-----------------------|
|nickname          |string |NOT NULL               |
|email             |string |NOT NULL               |
|encrypted_password|string |NOT NULL  val 6 >= char|
|last_name_kanji   |string |NOT NULL               |
|first_name_kanji  |string |NOT NULL               |
|last_name_kana    |string |NOT NULL               |
|first_name_kana   |string |NOT NULL               |
|birthday          |date   |NOT NULL               |
### Association
-has_many :items
-has_many :purchases


##items table
|Colum                  |Type     |Options                       |
|-----------------------|---------|------------------------------|
|name                   |string   |NOT NULL val Max40            |
|introduce              |text     |NOT NULL val Max1000          |
|category_id            |integer  |NOT NULL                      |
|state_id               |integer  |NOT NULL                      |
|delivery_burden_id     |integer  |NOT NULL                      |
|prefecture_id          |integer  |NOT NULL                      |
|delivery_dates_id      |integer  |NOT NULL                      |
|price                  |integer  |NOT NULL val 300=<, 9999999>= |
|user                   |reference|foreign_key :true             |
## Association
-belongs_to :user
-has_one :purchase

<!-- 添削にて不要 integer型とし、active_hashで下記を実装する
#integerオプションの選択肢について
|Colum    |Options                                                            |
|---------|------------------------------------------------------------------ |
|ENUM1    |レディス、メンズ、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、  |
|         |おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、          |
|         |ハンドメイド、その他                                                  |
|---------|------------------------------------------------------------------ |
|ENUM 2   |新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷やよ汚れあり、        |
|         |傷や汚れあり、全体的に状態が悪い                                        |
|---------|------------------------------------------------------------------|
|ENUM 3   |着払い（購入者負担）、送料込み（出品者負担）                             |
|---------|------------------------------------------------------------------|
|ENUM 4   |北海道、（略）、沖縄                                                 |
|---------|-----------------------------------------------------------------|
|ENUM 5   |1日〜2日で発送、2日〜3日で発送、4〜7日で発送                             |
|---------|-------------------------------------------------------------------|
-->


##purchases table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|user                  |reference|foreign_key :true             |
|item                  |reference|foreign_key :true             |
## Association
-belongs_to :user
-belongs_to :item
-has_one :shipping_address


##shipping_address table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|telephone_number      |string   |NOT NULL val 11char           |
|postal_code           |string   |NOT NULL val 8char            |
|prefecture_id         |integer  |NOT NULL                      |
|cities                |string   |NOT NULL                      |
|address               |string   |NOT NULL                      |
|building_name         |string   |                              |
|purchase              |reference|foreign_key :true             |

## Association
-belongs_to :purchase