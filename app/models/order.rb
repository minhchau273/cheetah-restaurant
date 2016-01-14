class Order < ActiveRecord::Base
  belongs_to :menu_item

  validates :menu_item, :name, presence: true
end
