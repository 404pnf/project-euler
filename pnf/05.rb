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
    (min..(i-1)).select { |j| r << j if i % j == 0}
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
  a,b = [n1,n2].sort # a <= b
  zxgb_recur a, b, b
end
p (1..20).to_a.reduce(1) { |r, i| r = zxgb(r, i); r}

=begin
# 下面的方法是错误的
# 发现第一次做的时候，大部分简单题做出来也是错误的！！
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

def prime_factors n, r=[]
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
=end
