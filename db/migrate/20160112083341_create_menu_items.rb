class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :section, index: true, foreign_key: true
      t.text :image_url

      t.timestamps null: false
    end
  end
end
