class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :picture

      t.timestamps
    end
  end
end
