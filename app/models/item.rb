class Item < ActiveRecord::Base
  
  attr_accessible :title, :description, :price, :picture
  
  @choice = Array.new
  
  def create_choices
    @choice = Array.new
    @choice << self.price - 20
    @choice << self.price - 10
    @choice << self.price
    @choice << self.price + 10
    @choice << self.price + 20
  end
  
  def choice
      return @choice
  end
  
  def self.random
    Item.find(Random.rand(Item.count)+1) 
  end
end
