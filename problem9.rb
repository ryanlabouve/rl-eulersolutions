# 
# projecteuler::problem9
#
# A Pythagorean triplet is a set of three natural number, a < b < c,
# for which, a**2 + b**2 = c**2
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000
# Find the product a*b*c

def is_triple(a,b,c)
  a**2 + b**2 == c**2 ? true : false
end


(1..998).each do |index|
  c = index
  #let..
  a, b = 1, 999-index
  while a + b + c == 1000 and b > 0
    if is_triple(a, b, c)
      puts "a,b,c: #{a},#{b},#{c}... a*b*c: #{a*b*c}" 
    end
    a+=1
    b-=1
  end
end