require 'minitest/autorun'

# Given an array of integers, return indices of the two numbers such that they
# add up to a specific target.
#
# You may assume that each input would have exactly one solution.
#
# Example:
#
# Given nums = [2, 7, 11, 15], target = 9,
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
#
# Notes:
# The problem states nothing about about the array being sorted despite the
# example given nor does it state anything about input constraints. We'll want
# to go ahead and start thinking about possible edge cases as we develop the
# algorithm.
#
# Brute force would give us O(n^2) as we iterate over each element and consider
# the remaining as possible solutions. Using pointers also doesn't seem to be
# a viable solution as that'd be the same thing as the brute force (however,
# this is not the case for the [two_sum_ii](two_sum_ii.rb) challenge.
#
# In order to get down to a O(n) time, we can take a "greedy" style approach and
# determine store information as we iterate through the Array. Essentially, by
# using a Hash we can store the value and location of numbers we've seen so far.
# If the target - current_index_value equals 0 then we have our solution.
#
# Technically, we don't need to check for an empty array or an array with less
# than two elements since the problem states that we can assume that each input
# has a valid answer.
#
# If there are repeat numbers, I've made the assumption that we'll return the
# index of the most recent occurance.
#
# I'd also like to point out that this solution makes a space/time tradeoff. If
# we use the brute force approach we get exponential time but constant space. In
# this one pass approach, we get O(n) space with O(n) time.
#
# Tags:
# single-pass, hash



# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
# Time complexity: O(n)
# Space complexity: O(n)
def two_sum(nums, target)
  memory = {}

  nums.each_with_index do |item, index|
    remainder = target - item

    if memory.include? remainder
      return memory[remainder], index
    else
      memory[item] = index
    end
  end
end

class TwoSumTester < MiniTest::Test
  def test_basic_cases
    assert_equal  [0, 1], two_sum([2,7,11,15], 9)
    assert_equal  [2, 3], two_sum([2,7,11,15], 26)
    assert_equal  [0, 1], two_sum([7,2,11,15], 9)
  end

  def test_edge_cases
    assert_equal  [2, 4], two_sum([2,7,11,15,-11], 0)
    assert_equal  [2, 4], two_sum([2,7,11,15,-11], 0)
    assert_equal  [5, 6], two_sum([2,2,2,2,2,2,-2], 0)
  end
end
