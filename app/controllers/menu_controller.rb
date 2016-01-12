class MenuController < ApplicationController
  def index
    @sections = Section.all

    section = Section.find_by_id(params[:section]) || Section.first
    @sort = params[:sort] || "alphabetical"
    @menu_items = case @sort
                  when "alphabetical" then section.menu_items.sort_by { |item| [item.name] }
                  when "price_low_to_high" then section.menu_items.sort_by { |item| [item.price] }
                  when "price_high_to_low" then section.menu_items.sort_by { |item| [item.price] }.reverse
                  else []
                  end
    @section_id = section.id
  end
end