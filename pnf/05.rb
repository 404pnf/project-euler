=begin
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=end

# 我不明白题目什么意思？
# 就是求最小公倍数吧？！

require 'prime'

def remove_factors min, limit
  r = []
  (min..limit).reverse_each do |i|
    (min..(i - 1)).select { |j| r << j if i % j == 0 }
  end
  (min..limit).to_a - r.uniq
end

def zxgb_recur a, b, n
  # 小心啊，这个递归也很容也写错
  if b % a == 0
    b
  else
    zxgb_recur a, b + n, n
  end
end

def zxgb n1, n2
  a, b = [n1, n2].sort # a <= b
  zxgb_recur a, b, b
end

def smallest_multiple *arg
  arg.reduce(1) { |a, e| a = zxgb(a, e) }
end

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_largest_prime_factor
    assert_equal 232_792_560 , smallest_multiple(*(1..20).to_a)
  end
end

