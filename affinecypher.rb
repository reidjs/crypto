#!/usr/bin/env ruby
#encrypt: y = ax + b mod 26
#decrypt: x = inverse_a*(y-b) mod 26 NOTICE inverse a is the multiplicative inverse not 1/az  
#the key is array [a,b]
def encrypt(x, key)
  x = x.ord - 65
  a = key[0]
  b = key[1]
  #p ((a*x+b)%26)
  return (((a*x+b)%26)+65).chr
end
def decrypt(y, key)
  y = y.ord + 65

  a = key[0]

  #to find inverse a we need to check every possible value against mod of all possible values
  #I'm not sure why, but you can ignore the even numbers. It has something to do with being relatively
  #prime.
  keyspace = (0..25).to_a.reject{|i| i % 2 == 0}
  # keyspace = (0..25).to_a
  a_inverse = nil
  keyspace.each do |i|
  #this is known as modular multiplicative inverse.
   if ((i * a - 1) % 26 == 0)
     a_inverse = i
   end
  end
  b = key[1]

  return (((a_inverse*(y-b))%26) + 65).chr
end
str = "ATTACK"
p "original string: "+str
key = [9,13]

e_str = ""
str.chars.each do |i|
  e_str += encrypt(i, key)
end
p "encrypted: "+e_str
d_str = 'decrypted: '
e_str.chars.each do |i|
  d_str += decrypt(i, key)
end
p d_str
#decrypt("a", [9,13])
# p(encrypt("A", [9,13]))
