class MenuController < ApplicationController
  def index
    @sections = Section.all
    params[:section_id] ||= Section.first.try(:id)
    section = Section.find_or_initialize_by(id: params[:section_id])
    @sort = params[:sort] || "alphabetical"
    @menu_items = case @sort
                  when "price_low_to_high" then section.menu_items.order(:price)
                  when "price_high_to_low" then section.menu_items.order(price: :desc )
                  else section.menu_items.order(:name)
                  end
    @section_id = section.id
  end
end
