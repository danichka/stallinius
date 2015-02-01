class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string  :name
      t.float   :price
      t.text    :specification
      t.integer :cart_id
      t.timestamps null: false
    end
  end
end
