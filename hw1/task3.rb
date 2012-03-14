def anagram_code(word)
  return word.downcase.chars.sort.join
end

def combine_anagrams(words)
  tmp_words = words.sort{|x, y| anagram_code(x) <=> anagram_code(y)}
  res = []
  cur = []
  tmp_words.each do |x|
    if cur.length == 0 or anagram_code(cur[0]) == anagram_code(x)
      cur << x
    else
       res << cur
       cur = [x]
    end
  end
  if cur.length != 0
    res << cur
  end
  return res
end
words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'];

combine_anagrams(words).each do |x|
  puts x
  puts "--"
end
