class Checkout < ActiveRecord::Base
  attr_accessible :name, :price, :picture
  
  @checkouts = Array.new
  
  def my_choices
    @checkouts = Array.new
    b = (1..(Checkout.count)).sort_by{rand}
    
    @checkouts << Checkout.find(b[1])
    @checkouts << Checkout.find(b[2])
    @checkouts << Checkout.find(b[3])
  end
  
  def checkouts
    return @checkouts
  end
end
