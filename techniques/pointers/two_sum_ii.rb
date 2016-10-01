require 'rspec'

# Task:
# Given an array of integers that is already sorted in ascending order, find two
# numbers such that they add up to a specific target number.
#
# The method two_sum should return indicies of the two numbers such that they add
# up to the target, where index1 must be less than index2.
#
# The returned answers are not zero-based.
#
# We may assume that each input would have exactly one solution.
#
# Input: numbers: {2,7,11,15} target: 9
# Output: [1, 2]
#
# Notes:
# The interesting bits here are that we have an array sorted in ascending order.
# The only indicies we're interested in are those that come before the first
# value that is greater than or equal to the target.

def two_sum(numbers, target)
  first_pointer, last_pointer = 0, numbers.size - 1

  while true
    sum = numbers[first_pointer] + numbers[last_pointer]
    if sum == target
      return [first_pointer + 1, last_pointer + 1]
    elsif sum < target
      first_pointer += 1
    else
      last_pointer -= 1
    end
  end
end

RSpec.shared_examples "a two_sum" do
  describe "<<" do
    it "returns an array containing indicies that sum to target" do
      res = two_sum(arr, target)
      expect(arr[res.first - 1] + arr[res.last - 1]).to eq(target)
      expect(res.first < res.last).to be_truthy
    end
  end
end

RSpec.describe "two_sum" do
  it_behaves_like "a two_sum" do
    let(:arr) { [2,7,11,15]}
    let(:target) { 9 }
  end

  it_behaves_like "a two_sum" do
    let(:arr) { [1,2,3,6,7,11,15]}
    let(:target) { 9 }
  end

  it_behaves_like "a two_sum" do
    let(:arr) { [1,2,3,6,7,11,15]}
    let(:target) { 10 }
  end

  it_behaves_like "a two_sum" do
    let(:arr) { [1,2,3,6]}
    let(:target) { 8 }
  end

  it_behaves_like "a two_sum" do
    let(:arr) { [0,0,3,4]}
    let(:target) { 0 }
  end

  it_behaves_like "a two_sum" do
    let(:arr) { [-3,3,4,90]}
    let(:target) { 0 }
  end
end
