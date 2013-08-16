=begin
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

require 'prime'

# so i cheated  :) with the std lib prime

def largest_prime_factor(n, r = [])
  prime = Prime.lazy
  r = r || []
  if n.prime?
    r << n
    return r
  else
    factor = prime.find { |j| n % j == 0 } # 用find，找到第一个就结束
    r << factor
    prime.rewind
    largest_prime_factor (n / factor), r
  end
  r.max
end

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_largest_prime_factor
    assert_equal 6857, largest_prime_factor(600_851_475_143)
  end
end
# 下面的算法也是错误的，因为它太慢了！
def largest_prime_factor_wrong(number)
  primes = Prime.lazy.take_while { |j| j < number }
  # 很慢很慢很慢
  # 因为先算了很多很多没有用的质数出来
  primes.to_a.reverse.find { |j| number % j == 0 }
end
