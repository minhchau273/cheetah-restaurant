class MenuItem < ActiveRecord::Base
  belongs_to :section

  include ActionView::Helpers::NumberHelper

  def image_url_or_default
   	if image_url.present?
   	  image_url
    else
      "http://loremflickr.com/320/240/#{CGI.escape name}"
   	end
  end

  def formated_price
    "#{number_with_precision(price, precision: 0, delimiter: ',')} VND"
  end
end
