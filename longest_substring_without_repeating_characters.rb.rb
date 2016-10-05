require 'minitest/autorun'
require 'set'

# Task:
# Given a string, find the length of the longest substring without repeating characters.
#
# Examples:
#
# Given "abcabcbb", the answer is "abc", which the length is 3.
#
# Given "bbbbb", the answer is "b", with the length of 1.
#
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
#
# Input: String
# Output: String
#
# Notes:
# My idea is to iterate through each index and use pointers to check if the next
# n letters are unique. This is O(n^2)
#
# I had a difficult time grasping the concept of a "window" of the longest
# substring
#
# space complexity is interesting:
# We need O(k) space for the sliding window, where k is the size of the Set.
# The size of the Set is upper bounded by the size of the stringnn and the
# size of the charset/alphabet m.
#
# Tags: hash, window

# @param {String} s
# @return {Integer}
# Time complexity: O(n^2)
# Space complexity O(min(n,m)) bound by size of string and set
# def length_of_longest_substring(s)

#   longest_substring = 0

#   (0...s.length).each do |index|

#     lookup = Hash.new(0)

#     lookup[s[index]] += 1
#     substring = 1

#     pointer = index + 1
#     while !lookup.has_key?(s[pointer]) && pointer < s.size
#       lookup[s[pointer]] += 1
#       substring += 1
#       pointer += 1
#     end

#     longest_substring = [longest_substring, substring].max
#   end
#   longest_substring
# end

# Time complexity: O(n) (techically, it's doing O(2n))
# Space complexity:O(min(m,n))
# def length_of_longest_substring(s)
#   record = Set.new
#   ans, left, right = 0, 0, 0
#   while left < s.size && right < s.size
#     if !record.include? s[right]
#       record.add s[right]
#       right += 1
#       ans = [ans, right - left].max
#     else
#       record.delete s[left]
#       left += 1
#     end
#   end
#   ans
# end

# Time complexity: O(n) (optimized to avoid second pass)
# Space complexity:O(min(m,n))
def length_of_longest_substring(s)
  ans, pointer = 0, 0
  lookup = {}
  (0...s.length).each do |index|
    if lookup.has_key? s[index]
      pointer = [lookup[s[index]], pointer].max
    end
    ans = [ans, index - pointer + 1].max
    lookup[s[index]] = index + 1
  end
  ans
end

class Tester < MiniTest::Test
  def test_substring
    assert_equal 3, length_of_longest_substring("abca")
    assert_equal 3, length_of_longest_substring("abcabcbb")
    assert_equal 4, length_of_longest_substring("abcadcbb")
    assert_equal 3, length_of_longest_substring("pwwkew")
    assert_equal 1, length_of_longest_substring("aaaaaaaa")
    assert_equal 4, length_of_longest_substring("aaabcd")
    assert_equal 0, length_of_longest_substring("")
    assert_equal 5, length_of_longest_substring("anviaj")
    assert_equal 3, length_of_longest_substring("abcabc")
  end
end

