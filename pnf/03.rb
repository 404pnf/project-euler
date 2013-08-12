=begin
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

require 'prime'

# so i cheated  :) with the std lib prime

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

p f 600851475143
p (f 600851475143).last