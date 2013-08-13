=begin
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

require 'prime'

# so i cheated  :) with the std lib prime

def ff n, r=[]
  prime = Prime.lazy
  r = r || []
  if n.prime?
    r << n
    return r
  else
    factor = prime.find { |j| n % j == 0} # 用find，找到第一个就结束
    r << factor
    prime.rewind
    ff (n / factor), r
  end
end

p ff 600851475143

=begin
# 下面的函数是错误的！！错在哪里我还没有发现
def f n, r=[]
  prime = Prime.lazy.to_enum
  r = r || []
  if n.prime?
    r << n
    return r
  else
    factor = prime.next
    unless n % factor == 0
      factor = prime.next
    end
    # so so slow
    # because need to caculate all the primes < n / 2 first, even though we might only need the first a few primes
    #factor = prime.take_while {|i| i < n / 2}.find {|i| n % i == 0}
    r << factor
    prime.rewind
    f (n / factor), r
  end
end

# 下面的算法也是错误的，因为它太慢了！
def largest_prime_factor number
  primes = Prime.lazy.take_while { |j| j < number} #很慢很慢很慢
  # 因为先算了很多很多没有用的质数出来
  primes.to_a.reverse.find { |j| number % j == 0}
end
=end
