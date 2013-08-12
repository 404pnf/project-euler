=begin
Largest palindrome product
Problem 4

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

# 让我再次偷懒用permutation

def palindrome? n
  n.to_s == n.to_s.reverse
end

range = (100..999)

candidates = (range.to_a + range.to_a).permutation(2)
# 是不是用product更好
# candidates = range.product range

result = candidates.reduce([]) {|col, (a, b)| col << a * b if palindrome? a * b; col}

p "符合要求的组合有#{result.size} 组"
p result.max


