class PagesController < ApplicationController
  def home
    @item = Item.random if Item.random
    @item.create_choices
  end
  
  def test
  end
  def result
    price = params[:choice]
    @item = Item.find(params[:item]) if Item.find(params[:item])
    @item.create_choices
    
    if price.to_i == @item.price.to_i
      @text = "You were right!"
      @win = 1
      add_to_score
    else
      @text = "You lost. :(  The price was $#{@item.price}"
      @win = 0
      subtract_from_score
    end
    
    redirect_to "/?win=#{@win}", notice: @text
    
  end
  
  def checkout
    @checkouts = Checkout.new
    @checkouts.my_choices
  end
  
  def checkresult
    price = params[:choice]
    @item = Item.find(params[:item]) if Item.find(params[:item])
    @item.create_choices
    
    if price.to_i == @item.price.to_i
      @text = "You win"
    else
      @text = "You lose.  price: #{@item.price}"
    end
    
    redirect_to @checkout, notice: @text
    
  end
  
  # THE FOLLOWING SHOULD NOT BE HERE
  # PLEASE REFACTOR THIS AT SOME POINT
  # PLEASE, PLEASE, PLEASE
  # WHY IS THIS HERE MICHAEL????
  private 
  
  def add_to_score
    session[:score] += (Random.rand(3)+1)*10
  end
  
  def subtract_from_score
    if session[:score]-5 > 0
      session[:score] -= 5 
    elsif session[:score] > 0
      session[:score] = 0
    else 
      session[:score] = 0
    end
  end
  # EVERYTHING ABOVE SHOULD BE PUT SOMEWHERE ELSE
  # IE IT SHOULD BE HERE!!
end
