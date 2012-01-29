#
# projecteuler::problem4
# 
# A palindromic number reads teh same both ways. The largest palindrome
# made from teh product of two 2-digit numbers is 9009 = 91 x 99.
#
# Find the largest palindrome made from the product of the 3-digit numbers.
#
def is_palindrome?(x)
  x.to_s == x.to_s.reverse ? true : false
end

palindromes = []

1000.times do |outer_index|
  1000.times do |inner_index|
    palindromes  << outer_index * inner_index   if is_palindrome? outer_index * inner_index
  end
end

puts palindromes.sort!.last