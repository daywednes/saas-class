class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name + "_history"

    a = %Q{ 
      def #{attr_name}=(new_value)
        if @#{attr_name}_history == nil then
          @#{attr_name}_history = Array.new
          @#{attr_name}_history << nil
        end
        @#{attr_name}_history << new_value
        @attr_name = new_value
      end
      }
    class_eval (a)
  end
end

class Foo
  attr_accessor_with_history :bar
  
end

f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history
