=begin
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=end

# 我不明白题目什么意思？
# 就是求最小公倍数吧？！

require 'prime'

# 找出一个数的所有质数因子
def f n, r=[]
  prime = Prime.lazy.to_enum
  r = r || []
  if n == 1 # 很微妙的边缘情况，让我晕了很久:)
    return r
  elsif n.prime?
    r << n
    return r
  else
    factor = prime.next
    unless n % factor == 0
      factor = prime.next
    end
    r << factor
    prime.rewind
    f (n / factor), r
  end
end

max = 20
numbers = (1..max).to_a

factors = numbers.map { |i| f(i)}
p factors 
result_coll = factors.reduce([]) { |r, i| r << i; r.flatten}.uniq
p '答案是：'
p result_coll.reduce(:*)

