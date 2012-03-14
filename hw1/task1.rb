def palindrome? str
  str_temp = str.downcase.gsub(/[^\w]/, '')
  return str_temp == str_temp.reverse
end


def count_words(string)
  res = {}
  string.downcase.split(/[^\w]+/).each do |item|
    if res.has_key?(item) 
      res[item] +=1
    else 
      res[item] = 1
    end
  end
  return res
end
 