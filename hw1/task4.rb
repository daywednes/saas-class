class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end
  attr_accessor :name
  attr_accessor :calories
  
end


class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    return  "black licorice" != @flavor
  end
  
  attr_accessor :flavor
end

a = Dessert.new("minh", 3)
  
puts a