#
# Given the following sequence rules...
#   n -> n/2 (n is even)
#   n -> 3n + 1 (n is odd)
#
# Starting with n[0] = 13, we would get the following sequence
#   13 -> 40 -> 20 -> 10 -> 16 -> 8 -> 4 -> 2 -> 1

def collatz_sequence(x) 
  a, n = [x], x

  while n != 1
    n % 2 == 0 ? a << n = n/2 : a << n = 3 * n + 1
  end
  a
end

res = { :index => 1, :sequence_length => collatz_sequence(1).length}

1.upto(999999) do |i| 
  this_len = collatz_sequence(i).length
  if  this_len > res[:sequence_length]
    res[:index] = i
    res[:sequence_length] = this_len
  end
end

p res

