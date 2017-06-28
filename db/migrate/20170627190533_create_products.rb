class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :sub_category_id
      t.timestamps
    end
  end
end
