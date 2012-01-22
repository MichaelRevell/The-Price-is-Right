class Item < ActiveRecord::Base
  
  attr_accessible :title, :description, :price, :picture
  
  @choice = Array.new
  
  def create_choices
    @choice = Array.new
    @delta = 1
    if (self.price <= 10)
      @delta = 1
    elsif (self.price <= 100)
      @delta = 10
    elsif (self.price <= 1000)
      @delta = 100
    elsif (self.price <= 10000)
      @delta = 1000
    elsif (self.price <= 100000)
      @delta = 10000
    elsif (self.price <= 1000000)
      @delta = 100000
    end
    #@delta = (self.price / (rand(5)+8))
    @choice << self.price - (4*@delta) if (self.price - (4*@delta) > 0)
    @choice << self.price - (3*@delta) if (self.price - (3*@delta) > 0)
    @choice << self.price - (2*@delta) if (self.price - (2*@delta) > 0)
    @choice << self.price - @delta
    @choice << self.price + @delta
    @choice << self.price + (2*@delta)
    @choice << self.price + (3*@delta)
    @choice << self.price + (4*@delta)
    
    @options = Array.new
    @options << self.price
    4.times do
      @price = @choice[Random.rand(@choice.count)]
      @choice.delete(@price)
      @options << @price
    end
    
    @choice = @options.sort
  end
  
  def choice
      return @choice
  end
  
  def self.random
    Item.find(Random.rand(Item.count)+1) 
  end
end
