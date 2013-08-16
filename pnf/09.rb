=begin
Special Pythagorean triplet
Problem 9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

require 'benchmark'
require 'benchmark'
# 也许这是少有的在ruby中用for循环看着更舒服的情况
# 从这里偷来的
# http://zacharydenton.com/project-euler-solutions/9/

# takes 3.4 second
def find_triplet limit
  for a in (1..limit)
      for b in (a..limit)
          for c in (b..limit)
              if a**2 + b**2 == c**2 && a + b + c == 1000
                 return a * b * c #
                  # 因为题目告诉我们了只有一个答案，提早推出，节省时间
              end
          end
      end
  end
end

# takes 0.02 second
def find_triplet_faster limit
  (1..limit).each do |a|
      (a..limit).each do |b|
              return a * b * (1000 - a - b) if a**2 + b**2 == (1000 - a - b)**2
      end
  end
end

# takes 3.3 second
def find_triplet2 limit
  (1..limit).each do |a|
      (a..limit).each do |b|
        (b..limit).each do |c|
            if a**2 + b**2 == c**2 && a + b + c == 1000
                return a * b * c
            end
         end
       end
  end
end

require 'test/unit'
# testing
class TestMyLast < Test::Unit::TestCase
  def test_find_triplet2
    assert_equal 31_875_000, find_triplet(500)
    assert_equal 31_875_000, find_triplet2(500)
    assert_equal 31_875_000, find_triplet_faster(500)
  end
end

# puts Benchmark.measure { find_triplet(500) }
# puts Benchmark.measure { find_triplet2(500) }
# 上面两个方法在我的imac上3秒多
# puts Benchmark.measure { find_triplet_faster(500) }
# 3.440000   0.020000   3.460000 (  3.458957)
# 3.290000   0.000000   3.290000 (  3.295173)
# 0.020000   0.000000   0.020000 (  0.017893)


=begin
太慢了
在我的imac上，死机！
a = (1..333).to_a
b = (2..499).to_a
c = (3..999).to_a

triplet = a.product b, c

c&&idates = triplet.select { |(a, b, c)| a < b && b < c && a ** 2 + b ** 2 == c ** 2 && a + b + c == 1000}

p c&&idates
=end
