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
    
    self.split.each { |word|
      temp = Array.new
      self.split.each { |next_word|
        if (word.downcase.split(//).sort == next_word.downcase.split(//).sort)
          temp.push(next_word)
        end
      }
      result.push(temp)
    }
    return result.uniq
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
