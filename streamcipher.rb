#stream ciphers encrypt each 'bit' individually

#encryption: yi = e(xi) = xi + si % 2
#decryption: xi = d(yi) = yi + si % 2
#XOR on bits is the same as modulo 2 because
#1 ^ 0 = 1
#0 ^ 1 = 1
#1 ^ 1 = 0
#0 ^ 0 = 0
#input: character to be encrypted or decrypted, character in the stream
#output: encrypted or decrypted character 
def encrypt_char(x, s)
  (x + s) % 2
end

def decrypt_char(y, s)
  #decryption and encryption are identical in a stream cipher
  encrypt_bit(y, s)
end

#input string
# def ASCII_to_binary(c)
#   #convert the character to base 10
#   base10 = c.ord
#   p base10
#   #convert from base 10 to base 2
#   base2 = [0,0,0,0,0,0,0]
#   while base10 > 0
#     #pick the largest 2^n that goes into base10 digit
#     n = (Math.log(base10)/Math.log(2)).floor
#     base10 -= 2**n
#     base2[n] = 1
#     #p base2.reverse
#   end
#   base2.reverse
# end

# https://stackoverflow.com/questions/31307126/create-a-decimal-to-binary-converter-using-ruby
def ASCII_to_binary(c)
  c.ord.to_s(2)
end
stream = "0101100"
p ASCII_to_binary('m')
