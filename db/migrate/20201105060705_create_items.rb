class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduce
      t.integer :category_id
      t.integer :state_id
      t.integer :delivery_burden_id
      t.integer :prefecture_id
      t.integer :delivery_dates_id
      t.string :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
