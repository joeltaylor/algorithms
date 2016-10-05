require 'minitest/autorun'

# Task:
#
# Rotate an array of n elements to the right by k steps.
#
# For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].
#
# Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
#
# Input: @nums {[]Integer}, @k Integer
# Output: None, modify @nums in place
#
# Notes:
# The challenge wants us to do this in-place. My initial thought is to pop shift
# `k` number of times.
#
# Tags:

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k = k % nums.length
  k.times do
    nums.unshift(nums.pop)
  end
  nums
end

class TestPopShift < MiniTest::Test
  def test_pop_shift
    assert_equal [5,6,7,1,2,3,4], rotate((1..7).to_a, 3)
    assert_equal [7,8,9,1,2,3,4,5,6], rotate((1..9).to_a, 12)
  end
end

