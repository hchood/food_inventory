class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :quantity, null: false
    end
  end
end
