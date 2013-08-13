
=begin
Multiples of 3 and 5
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=end

# http://projecteuler.net/problem=1

# 小心重复计算了那些是15的倍数的数
# 没想到第一题就有陷阱啊！

# 不包括1000，因为原文是“below 1000” 
a = (1..999).select { |i| i % 3 == 0} + (1..999).select { |i| i % 5 == 0}
p a.uniq.reduce(:+)
p (1..999).select {|i| i % 3 == 0 or i % 5 == 0}.reduce(:+)




