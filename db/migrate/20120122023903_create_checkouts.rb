class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :name
      t.integer :price
      t.string :picture

      t.timestamps
    end
  end
end
