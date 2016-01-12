class ChangeImageUrlFromTextToStringInMenuItems < ActiveRecord::Migration
  def up
  	change_column :menu_items, :image_url, :string
  end

  def down
  	change_column :menu_items, :image_url, :text
  end
end
