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
|birthday_year     |       |NOT NULL               |
|birthday_month    |       |NOT NULL               |
|birthday_days     |       |NOT NULL               |
### Association
-has_many :itmes
-has_many :perchases


##items table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|item_image            |ActiveStorage                           |
|item_name             |text     |NOT NULL val Max40            |
|item_introduce        |text     |NOT NULL val Max1000          |
|item_details_category |         |NOT NULL                      |
|item_details_state    |         |NOT NULL                      |
|delivery_burden       |         |NOT NULL                      |
|delivery_ prefecture  |         |NOT NULL                      |
|delivery_dates        |         |NOT NULL                      |
|price                 |string   |NOT NULL val 300=<, 9999999>= |
|user_id               |reference|foreign_key :true             |

## Association
-belongs_to :user
-has_one :purchase


##purchases table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|card_id               |string   |NOT NULL val 12char           |
|expiration_date_month |         |NOT NULL                      |
|expiration_date_year  |         |NOT NULL                      |
|telephone_number      |string   |NOT NULL val 11char           |
|user_id               |reference|foreign_key :true             |
|item_id               |reference|foreign_key :true             |
## Association
-belongs_to :user
-belongs_to :item

##shipping_adress table
|Colum                 |Type     |Options                       |
|----------------------|---------|------------------------------|
|posal_code            |string   |NOT NULL val 8char            |
|prefecture            |         |NOT NULL                      |
|cities                |text     |NOT NULL                      |
|adress                |text     |NOT NULL                      |
|building_name         |text     |                              |
|user_id               |reference|foreign_key :true             |
|item_id               |reference|foreign_key :true             |
## Association
-belongs_to :perchase