class MenuController < ApplicationController
  def index
    @sections = Section.all
    params[:section] ||= Section.first.try(:id)
    section = Section.find_or_initialize_by(id: params[:section])
    @sort = params[:sort] || "alphabetical"
    @menu_items = case @sort
                  when "price_low_to_high" then section.menu_items.sort_by { |item| [item.price] }
                  when "price_high_to_low" then section.menu_items.sort_by { |item| [-item.price] }
                  else section.menu_items.sort_by { |item| [item.name] }
                  end
    @section_id = section.id
  end
end
