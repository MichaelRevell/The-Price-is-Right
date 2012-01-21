class PagesController < ApplicationController
  def home
    @item = Item.first if Item.first
    @item.create_choices
  end
  
  def result
    price = params[:q]
    @item = Item.first if Item.first
    @item.create_choices
    
    if price.to_i == @item.price.to_i
      @text = "You win"
    else
      @text = "You lose.  price: #{@item.price}"
    end
    
  end

end
