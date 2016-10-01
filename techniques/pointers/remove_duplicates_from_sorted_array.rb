require 'rspec'

# Task:
# Given a sorted array, remove the duplicates in place such that each element
# appear only once and return the new length
#
# Do not allocate space for another array, you must do this in place with
# constant memory.
#
# Input: [1,1,2]
# Output: 2 (
# The first 2 elements be [1,2] and what comes after that doesn't matter.
#
# Notes:
# Two components immediately stand out about this challenge — the array is
# already sorted and we need to return the length of the unique array so that
# the element could be sliced to give back a unique array.
#
# A sorted array means that it's simple to check for duplicates. All we need to
# do is look ahead and we'll know whether or nor there duplicates are present.
#
# Needing to order modify the array in place means tells us that we need to keep
# track of two things: the index of the integer we're checking (which also gives
# us the index of where to put the next interger) and the index of the location
# we're checking. This is a perfect example of a slow-pointer and a
# fast-pointer.

# @param {Integer[]} nums
# Returns {Integer}
#
# Time Complexity: O(n)
# Space Complexity: O(1)
def remove_duplicates(nums)
  return 0 if nums.empty || nums.nil?

  first_pointer, second_pointer = 0, 1

  while second_pointer < nums.length
    if nums[first_pointer] != nums[second_pointer]
      first_pointer += 1
      nums[first_pointer] = nums[second_pointer]
    end
    second_pointer += 1
  end

  first_pointer + 1
end

RSpec.describe 'remove_duplicates' do
  subject { remove_duplicates(nums) }

  context "small example" do
    let(:nums) { [1,1,2] }

    it "returns the length of unqiue integers" do
      expect(subject).to eq(2)
    end

    it "modifies the array" do
      expect(nums[0,subject]).to eq([1,2])
    end
  end

  context "larger exmaple" do
    let(:nums) { [1,1,2,2,2,3,4,5,5,5,6,6,6,6,7,7,8,9,10,11,12,12,12,12,12] }

    it "returns the length of unqiue integers" do
      expect(subject).to eq(12)
    end

    it "modifies the array" do
      expect(nums[0,subject]).to eq([1,2,3,4,5,6,7,8,9,10,11,12])
    end
  end

  context "edge cases" do
    it "returns 0 when array is empty" do
      expect(remove_duplicates([])).to eq(0)
    end

    it "returns 0 when input is not an array" do
    end
  end
end


