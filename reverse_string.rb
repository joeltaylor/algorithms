require 'rspec'

# Task:
# Reverse a string in place without using any other data structures.
#
# Input: "abc"
# Output: "cba"
#
# Notes:
# A common approach is to use an iterative swap as shown in Swap. While this
# approach works, it is more likely to introduce bugs as we need to make sure it
# works correctly with an odd and even number of characters.
#
# On the other hand, by using two pointers, the logic is simplified and we don't
# have to deal with worrying about "one off" errors or incorrectly handling an
# odd amount of characters.
#
# If we were to be strict, simply having an index to a length n array requires
# O(log n) bits. However, pointer sizes are often considered to be constants.
#

# Time complexity: O(n)
# Space complexity: O(1)
class Swap
  def self.reverse(string)
    length = string.size
    (0...length/2).each do |index|
      opposite = length - 1 - index
      string[index], string[opposite] = string[opposite], string[index]
    end
    string
  end
end


# Time complexity: O(n)
# Space complexity: O(1)
class Pointer
  def self.reverse(string)
    first, last = 0, string.length-1
    while first < last
      string[first], string[last] = string[last], string[first]
      first += 1
      last -= 1
    end
    string
  end
end

RSpec.describe Swap do
  it "reverses an odd number of characters" do
    expect(Swap.reverse("abc")).to eq("cba")
  end

  it "reverses an even number of characters" do
    expect(Swap.reverse("abcd")).to eq("dcba")
  end
end

RSpec.describe Pointer do
  it "reverses an odd number of characters" do
    expect(Pointer.reverse("abc")).to eq("cba")
  end

  it "reverses an even number of characters" do
    expect(Pointer.reverse("abcd")).to eq("dcba")
  end
end
