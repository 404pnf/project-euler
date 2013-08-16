
# http://projecteuler.net/problem=1

# below 1000, that is 999
def sum_of_multiples(max, a, b)
  (1..max).select { |i| i % a == 0 || i % 5 == 0 }.reduce(:+)
end

require 'test/unit'

# testing testing
class TestMyLast < Test::Unit::TestCase
  def test_sum_of_multiples
    assert_equal 233_168, sum_of_multiples(999, 3, 5)
  end
end