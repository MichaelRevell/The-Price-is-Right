class Checkout < ActiveRecord::Base
  attr_accessible :name, :price, :picture
  
  @checkouts = Array.new
  
  def my_choices
    @checkouts = Array.new
    b = (1..(Item.count)).sort_by{rand}
    
    @checkouts << Item.find(b[1])
    @checkouts << Item.find(b[2])
    @checkouts << Item.find(b[3])
  end
  
  def checkouts
    return @checkouts
  end
end
