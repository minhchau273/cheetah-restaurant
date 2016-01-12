class MenuController < ApplicationController
  def index
    @sections = Section.all

    section = Section.find_by_id(params[:section]) || Section.first
    @menu_items = section.menu_items
    @section_id = section.id
  end
end