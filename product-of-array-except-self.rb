require 'minitest/autorun'
# Task:
# Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Solve it without division and in O(n).
#
# For example, given [1,2,3,4], return [24,12,8,6].
#
# Follow up:
# Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
#
# Input: []Integer
# Output: []Integer
#
# Notes:
# Division is obviously the easy way out. In order to do this in O(n) time, that
# means I'll need to make use of pointers (considering the follow up that we can
# solve this in constant space.)
#
# Brute force would be O(n^2) by iterating over the array n times and for each
# iteration we get the product of all the indicies except the current.
#
# With a bigger example, it's apparent that we are performing the same
# multiplication over indicies. However, to make use of caching we'd need
# something like a hash...unless we can use the array itself as a cache.
#
# [1,2,3,4,5,6,7,8,9,10]
#
# Tags:


# @param {Integer[]} nums
# @return {Integer[]}
#
# Time complexity: O(n^2)
# Space complexity: O(1)
def brute_force_product_except_self(nums)
  output = []
  nums.each_with_index do |item, index|
    nums.each_with_index do |item2, index2|
      if index != index2
        output[index] ? output[index] *= item2 : output[index] = item2
      end
    end
  end
  output
end

def product_except_self(nums)
  product = []
  product_so_far = 1

  (0...nums.length).each do |index|
    product[index] = product_so_far
    product_so_far *= nums[index]
  end

  product_so_far = 1
  (nums.length-1).downto(0).each do |index|
    product[index] *= product_so_far
    product_so_far *= nums[index]
  end
  product
end

class Tester < MiniTest::Test
  def test_cases
    assert_equal [2,1], product_except_self([1,2])
    assert_equal [12,8,6], product_except_self([2,3,4])
    assert_equal [24,12,8,6],  product_except_self([1,2,3,4])
  end
end
