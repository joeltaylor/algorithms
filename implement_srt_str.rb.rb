require 'minitest/autorun'

# Task:
#
# Implement strStr().
#
# Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
#
# Input: String (unicode, capital, words)
# Output: Integer
#
# Notes: While this is plenty effecient, using the KMP alogirithm would be
# moreso.
#
# Tags: pointer

# @param {String} haystack
# @param {String} needle
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(1)
def str_str(haystack, needle)
    return 0 if needle.empty?
    return -1 if needle.length > haystack.length
    
    (0..haystack.length - needle.length).each do |index|
        if haystack[index] == needle[0]
          return index if haystack[index, needle.length] == needle
        end
    end
    -1
end

class Tester < MiniTest::Test
  def test_srt_srt
    assert_equal 1, str_str("abc", "b")
    assert_equal 2, str_str("abcd", "cd")
    assert_equal 6, str_str("hello world", "world")
    assert_equal 6, str_str("hello World", "World")
    assert_equal -1, str_str("hello World", "world")
    assert_equal -1, str_str("", "b")
    assert_equal 0, str_str("abc", "")
    assert_equal 0, str_str("","")
  end
end
