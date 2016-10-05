require 'minitest/autorun'

# Task:
# Given an input string, reverse the string word by word. A word is defined as a sequence of non-space characters.
#
# The input string does not contain leading or trailing spaces and the words are always separated by a single space.
#
# For example,
# Given s = "the sky is blue",
# return "blue is sky the".
#
# Could you do it in-place without allocating extra space?
#
# Input: A string of n length
# Output: String with words reversed
#
# Notes:
# I already know from the [reverse_string](reverse_string.rb) challenge that I
# can reverse a single word in O(n) time and O(1) space using two pointers.
# "dog" -> "god"
#
# However, this reverses a string and we want to reverse the word order
# "the dog" -> "dog the"
#
# My first though is that I could reverse the string and then reverse each word
# individually. At first, I thought that'd be O(n^2), but really it's just O(n).
#
# Tags:
# two-pointer-technique

def reverse(string, first = 0, last = string.size - 1)
  while first < last
    string[first], string[last] = string[last], string[first]
    first += 1
    last -= 1
  end
  string
end

def reverse_sentence(string)
  reverse(string)

  current_index = 0
  (0..string.length).each do |index|
    if (string[index] == " " || index == string.length)
      reverse(string, current_index, index - 1)
      current_index = index+1
    end
  end
  string
end


class Tester < MiniTest::Test
  def test_no_space_reverse
    assert_equal "god", reverse("dog")
  end

  def test_with_spaces
    assert_equal "dog the", reverse_sentence("the dog")
    assert_equal "dog  the", reverse_sentence("the  dog")
  end

  def test_with_punctuation
    assert_equal "dog the said Hello,", reverse_sentence("Hello, said the dog")
  end


end
