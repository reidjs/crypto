#Also known as the caesar cipher
#Warning: Converts everything to lowercase for simplicity
#encrypt: e(x) = x + k mod 26
#decrypt: d(y) = y - k mod 26

#input: string to be encrypted, key (int)
#output: encrypted string as a comma separated string
def encrypt(x, k)
  e = []
  x.numerify.each {|i| e << ((i + k) % 26)}
  e.denumerify
end
#input: takes in an encrypted string and the key,
#output returns the decrypted string
def decrypt(y, k)
  d = []
  y.numerify.each{|i| d << ((i - k) % 26)}
  d.denumerify
end

class String
  #makes it so that 'a' is 0, 'b' is 1, etc.
  def numerify
    num = []
    self.downcase.each_char {|c| num << c.ord - 97}
    num
  end

end

class Array
  #takes an array of encrypted letters (as numbers) and turns into lowercase letters
  def denumerify
    letters = ""
    self.each {|n| letters += (n + 97).chr}
    letters
  end
end
# p ''.denumerify

x = encrypt('attack', 17)
p decrypt(x, 17)
