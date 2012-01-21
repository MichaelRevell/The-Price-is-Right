class PagesController < ApplicationController
  def home
    @item = Item.first if Item.first
    @item.create_choices
  end

end
