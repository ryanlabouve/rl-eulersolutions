#
# projecteuler::problem12
#
# What is the value of the first triangle number to have over five hundred divisors?
#

#
# This was my version of making factors.
# It's very very very slow... so I borrowed a
# factorization method from elsewhere
#
# Returns all factors of x in array
# def factorization(x)
#   factors = []
#   (1..(x/2).floor).each do |i|
#     factors << i if x % i == 0
#   end
#   factors << x
# end


# http://rosettacode.org/wiki/Factors_of_an_integer#Ruby
class Integer
  def factors()
    1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i| 
      f << i
      f << self/i unless i == self/i
      f
    end.sort
  end
end

(1..70000000000).each do |i|
  tri_num = (1..i).to_a.inject(:+)
  if tri_num.factors.length > 500
   puts "#{tri_num} :: #{tri_num.factors}"
   exit
  end
end