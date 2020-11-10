class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name                        , null: false
      t.text :introduce                     , null: false
      t.integer :category_id                , null: false
      t.integer :state_id                   , null: false
      t.integer :delivery_burden_id         , null: false
      t.integer :prefecture_id              , null: false
      t.integer :delivery_date_id           , null: false
      t.string :price                       , null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
