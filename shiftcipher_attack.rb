#page 24, problem 1.2 attack on a shift cipher encrypted string
require 'words_counted'

encrypted_string = "xultpaajcxitltlxaarpjhtiwtgxktghidhipxciwtvgtpilpitghlxiwiwtxgqadds"
#https://stackoverflow.com/questions/9675146/how-to-get-words-frequency-in-efficient-way-with-ruby
class String
  def frequency
    self.chomp.each_char.with_object(Hash.new(0)) do |letter, hash|
      hash[letter.downcase] += 1
    end
  end
  #makes it so that 'a' is 0, 'b' is 1, etc.
  def numerify
    num = []
    self.downcase.each_char {|c| num << c.ord - 97}
    num
  end
end

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

class Array
  #takes an array of encrypted letters (as numbers) and turns into lowercase letters
  def denumerify
    letters = ""
    self.each {|n| letters += (n + 97).chr}
    letters
  end
end
letter_freq = encrypted_string.frequency
#sort by occurance
sorted_letter_frequency = []
letter_freq.each_pair do |i|
  sorted_letter_frequency << i
  sorted_letter_frequency.sort! do |i, j|
    j[1] <=> i[1]
  end
end
p sorted_letter_frequency
#t is probably space or e, i is probably e or a, x is probably t or a
#probably k = 15?
p decrypt(encrypted_string, 15)
#correct! notice that 4->19 difference 15 (t is e)
#8 -> 0 difference 15 (i is a)
#can be solved with just _two_ identified letters. Shift cipher is not safe!
