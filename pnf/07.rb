=begin
10001st prime
Problem 7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?

=end

# 先来偷懒的做法
require 'prime'

# p Prime.lazy.take(10001).to_a.last

# 再来正统的算法
# 还是算了吧。一直没懂那个什么shieve的算法

# 特别傻的方法

def p? n
  if n < 2
    false
  else
    (2..n).all? { |i| n % i != 0 }
  end
end

# wrong; don't know how to do it
def n_primes n
  n = 1
  r = []
  loop do
    if p?(n)
      r << n
    end
    n += 1
    if r.size == n
      break
    end 
  end
end

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_n_primes
    assert_equal 104_743, Prime.lazy.take(10001).to_a.last
  end
end