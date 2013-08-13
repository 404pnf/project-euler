
=begin
Multiples of 3 and 5
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=end

# http://projecteuler.net/problem=1

# 小心重复计算了那些是15的倍数的数
# 没想到第一题就有陷阱啊！

def sum_of_multiples(min: 1, max: 1000, factors: [3,5])
  r = []
  factors.each do |i|
    r << (min..max).select { |j| j % i == 0}
  end
  r.flatten.reject {|i| i % factors.reduce(:*) == 0}.reduce(:+)
end

p (1..1000).select {|i| i % 3 == 0 or i % 5 == 0}.reject {|i| i % 15 == 0}.reduce(:+)
p sum_of_multiples


