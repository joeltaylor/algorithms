require 'minitest/autorun'

# Task:
# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
#
# For example,
# "A man, a plan, a canal: Panama" is a palindrome.
# "race a car" is not a palindrome.
#
# Have you consider that the string might be empty? This is a good question to ask during an interview.
#
# For the purpose of this problem, we define empty string as valid palindrome.
#
# Input: String
# Output: Boolean
#
# Notes:
# A valid palindrom is the same forwards and backwards. This means that we can
# use two pointers to compare each char. The fun part of this is removing the
# punctuation.
#
# Tags:


# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s.gsub!(/\W/, '')
  s.downcase!
  start, last = 0, s.length - 1
  while start < last
    return false if s[start] != s[last]
    start += 1
    last -= 1
  end
  true
end

class Tester < MiniTest::Test
  def test_palindromes
    assert_equal true, is_palindrome("racecar")
    assert_equal true, is_palindrome("race car")
    assert_equal true, is_palindrome("A man, a plan, a canal: Panama")
    assert_equal true, is_palindrome("")
  end

end
