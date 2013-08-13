=begin
Special Pythagorean triplet
Problem 9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

require 'profile'

a = (1..333).to_a
b = (2..499).to_a
c = (3..999).to_a

triplet = a.product b, c

candidates = triplet.select { |(a, b, c)| a < b && b < c && a ** 2 + b ** 2 == c ** 2 && a + b + c == 1000}

p candidates
