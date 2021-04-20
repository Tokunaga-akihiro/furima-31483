class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer     :category_id,         null: false
      t.integer     :status_id,           null: false
      t.integer     :delivery_fee_id,     null: false
      t.integer     :shipping_area_id,    null: false
      t.integer     :ship_date_id,        null: false
      t.integer     :price,               null: false
      t.text        :description,         null: false
      t.string      :product_name,        null: false, default: ""
      t.references  :user,                foreign_key: true
      t.timestamps
    end
  end
end
