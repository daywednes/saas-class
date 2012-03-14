class CartesianProduct
  include Enumerable
  def initialize(first_list, second_list)
    @first_list = first_list
    @second_list = second_list
  end
  
  attr_accessor :first_list
  attr_accessor :second_list
  
  def each()
    first_list.each { |item_1|
      second_list.each{ |item_2|
        yield [item_1, item_2]
      }
    }
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
