require 'minitest/autorun'

# Task:
# Given two strings s and t, write a function to determine if t is an anagram of s.
#
# For example,
# s = "anagram", t = "nagaram", return true.
# s = "rat", t = "car", return false.
#
# You may assume the string contains only lowercase alphabets.
#
# What if the inputs contain unicode characters? How would you adapt your solution to such case?
#
# Input: String [a-z]
# Output: Boolean
#
# Notes:
#
# Tags: hash

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length

  lookup = Hash.new(0)

  (0...s.length).each do |index|
    lookup[s[index]] += 1
  end

  (0...t.length).each do |index|
    return false if lookup[t[index]] == 0
    lookup[t[index]] -= 1
  end

  return lookup.values.reduce(:+) == 0 || lookup.empty?

end


class Tester < Minitest::Test
  def test_anagram_true
    assert is_anagram("", "")
    assert is_anagram("cat", "tac")
  end

  def test_anagram_false
    refute is_anagram("abc", "abcd")
    refute is_anagram("aabbcc", "aabbdd")
  end
end
