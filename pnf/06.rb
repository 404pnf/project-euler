=begin
Sum square difference
Problem 6

The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

=end

def sum_of_sq range
  range.to_a.map { |i| i**2 }.reduce(:+)
end

def sq_of_sum range
  range.to_a.reduce(:+)**2
end

def r
  numbers = (1..100)
  sq_of_sum(numbers) - sum_of_sq(numbers)
end

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_r
    assert_equal 25_164_150 , r
  end
end
