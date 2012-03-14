class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(symbol)
    singular_currency = symbol.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      self
    end
  end
end

class String
  def method_missing(method_id)
    method = method_id.to_s
    if method == "palindrome?"
      self == self.reverse
    end
  end
end

module Enumerable
  def method_missing(method_id)
    #method = method_id.to_s.gsub( /s?$/, '')
    method = method_id.to_s
    if method == "palindrome?"
      self == self.reverse
    end
  end
end
puts "minhnim".palindrome?
puts 1.dollar.in(:rupees)
puts [1,3,3,2,1].palindrome?

puts 10.rupees.in(:euro)
