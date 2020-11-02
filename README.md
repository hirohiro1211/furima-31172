#テーブル設計

##users table
|Colum             |Type   |Options                |
|------------------|-------|-----------------------|
|nickname          |string |NOT NULL               |
|email             |string |NOT NULL               |
|password          |string |NOT NULL  val 6 >= char|
|last_name(kanji)  |text   |NOT NULL               |
|first_name(kanji) |text   |NOT NULL               |
|last_name(kana)   |text   |NOT NULL               |
|first_name(kana)  |text   |NOT NULL               |
|birthday          |DATE   |NOT NULL               |
### Association
-has_many :items
-has_many :purchases


##items table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|item_image            |ActiveStorage                           |
|item_name             |text     |NOT NULL val Max40            |
|item_introduce        |text     |NOT NULL val Max1000          |
|item_details_category |ENUM 1   |NOT NULL                      |
|item_details_state    |ENUM 2   |NOT NULL                      |
|delivery_burden       |ENUM 3   |NOT NULL                      |
|delivery_ prefecture  |ENUM 4   |NOT NULL                      |
|delivery_dates        |ENUM 5   |NOT NULL                      |
|price                 |string   |NOT NULL val 300=<, 9999999>= |
|user_id               |reference|foreign_key :true             |
## Association
-belongs_to :user
-has_one :purchase

#ENUMオプションの選択肢について
|Type     |Options                                                            |
|---------|------------------------------------------------------------------ |
|ENUM 1   |レディス、メンズ、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、  |
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


##purchases table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|card_id               |string   |NOT NULL val 12char           |
|expiration_date_month |string   |NOT NULL                      |
|expiration_date_year  |string   |NOT NULL                      |
|security_number       |string   |NOT NULL val 3 or 4 char      |
|telephone_number      |string   |NOT NULL val 11char           |
|user_id               |reference|foreign_key :true             |
|item_id               |reference|foreign_key :true             |
## Association
-belongs_to :user
-belongs_to :item


##shipping_address table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|postal_code           |string   |NOT NULL val 8char            |
|prefecture            |ENUM 4   |NOT NULL                      |
|cities                |text     |NOT NULL                      |
|address               |text     |NOT NULL                      |
|building_name         |text     |                              |
|purchase_id           |reference|foreign_key :true             |
## Association
-belongs_to :purchase

#ENUMオプションの選択肢について
|Type     |Options                                                            |
|---------|------------------------------------------------------------------|
|ENUM 4   |北海道、（略）、沖縄                                                 |
|---------|-----------------------------------------------------------------|