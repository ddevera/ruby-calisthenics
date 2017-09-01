module FunWithStrings
  def palindrome?
    self.downcase.gsub(/\W/x, "") == self.reverse.downcase.gsub(/\W/x, "")
  end
  def count_words
    h = Hash.new(0)
    self.downcase.gsub(/\W/, " ").each_line { |line|
      words = line.split
      words.each { |w|
        if h.has_key?(w)
          h[w] = h[w] + 1
        else
          h[w] = 1
        end
      }
    }
    return h
  end
  def anagram_groups
    result = Array.new
    
    self.each_line { |word|
      temp = []
      self.each_line { |next_word|
        if (word.downcase.split(//) == next_word.downcase.split(//))
          temp.push(next_word)
        end
      }
    }
    return result
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
