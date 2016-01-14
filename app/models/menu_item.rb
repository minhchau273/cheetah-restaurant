class MenuItem < ActiveRecord::Base
  belongs_to :section
  has_many :orders, dependent: :destroy

  include ActionView::Helpers::NumberHelper

  IMAGE_BASE_URL = "http://loremflickr.com/320/240/"

  def image_url_or_default
   	if image_url.present?
   	  image_url
    else
      "#{IMAGE_BASE_URL}#{CGI.escape name}"
   	end
  end

  def formated_price
    "#{number_with_precision(price, precision: 0, delimiter: ',')} VND"
  end
end
