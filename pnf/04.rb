=begin
Largest palindrome product
Problem 4

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

# 让我再次偷懒用permutation

def palindrome? n
  n.to_s == n.to_s.reverse
end

def max_palidrome_product
  range = (100..999).to_a
  combination = range.product range
  r = []
  combination.each { |(a, b)| r << (a * b) if palindrome?(a * b) }
  r.max
end

# p "符合要求的组合有#{result.size} 组"
# p result.max

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_max_panlidrome_product
    assert_equal 906_609 , max_palidrome_product
  end
end
