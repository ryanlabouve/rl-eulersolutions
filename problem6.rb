#
# projecteuler::problem6
#
# The sum of the squares of the first ten natural numbers is,
#     1^2 + 2^2 + ... 10^2 = 385
# 
# The square of the sum of the first ten natural numbers is,
#     (1+2+...+10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sums is 3025 - 385 = 2640
# 
# Find the difference between the sum of teh squares of the first one hundred natural
# numbers and the square of the sums.


def sum_of_squares(x,y)
  (x..y).to_a.collect! { |i| i**2}.inject(:+)
end

def square_of_sums(x,y)
  (x..y).inject(:+)**2
end

puts square_of_sums(1,100) - sum_of_squares(1,100)
