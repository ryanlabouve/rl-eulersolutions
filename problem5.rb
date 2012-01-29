#
# projecteuler::problem5
#
# 2520 is the smallest number that can be devided by each of the numbers from
# 1 to 10 without any remainder/
#
# What is the smallest positive number than is evenly divisible by all the numbers
# from 1 to 20
def divisible_by_x?(num, x)
  num % x == 0 ? true : false
end

def divisible_by_x_to_y(num, x, y)
  (x..y).each do |index|
    return false if not divisible_by_x?(num, index)
  end
  true
end

#puts("#{divisible_by_x_to_y(2520,1,10)}") # => true

for i in (20..4000000000).step(20)
  if divisible_by_x_to_y(i, 1, 20)
    puts i
    break
  end
end