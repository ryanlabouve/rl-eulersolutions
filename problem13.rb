#
# projecteuler::problem13
#
# Work out the first ten digits of the sum of the following one-hundred 50 digit numbers
#
#   [problem 13.txt]
# 

sum = 0
File.open('problem13.txt', 'r') do |f|
  for line in f.readlines
    sum += line.to_i
  end
end
puts sum.to_s[0..9]