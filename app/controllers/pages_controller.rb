class PagesController < ApplicationController
  def home
    @item = Item.random if Item.random
    @item.create_choices
  end
  
  def result
    price = params[:q]
    @item = Item.find(params[:item]) if Item.find(params[:item])
    @item.create_choices
    
    if price.to_i == @item.price.to_i
      @text = "You win"
    else
      @text = "You lose.  price: #{@item.price}"
    end
    
  end

end
