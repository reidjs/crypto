require 'words_counted'
#compute relative frequency of all letters in cyphertext
f = File.open("encrypted", "r")
contents = f.read
#p contents
#find letter frequency
letter_freq = {}
contents.chars.each do |i|
  letter_freq[i].nil? ? letter_freq[i] = 1 : letter_freq[i] += 1
end
sorted_letter_frequency = []
#sort by occurance
letter_freq.each_pair do |i|
  sorted_letter_frequency << i
  sorted_letter_frequency.sort! do |i, j|
    j[1] <=> i[1]
  end
end

#find percentages of each letter
sorted_percentages_by_letter = []
num_letters = contents.length
sorted_letter_frequency.each do |i|
  sorted_percentages_by_letter << [i[0], (i[1].to_f/num_letters * 100).round(2)]
end
p sorted_percentages_by_letter
x = WordsCounted.from_file("encrypted")
# p x.token_frequency
replacements = {"r"=>"e", "b"=>"t", "m"=>"a", "p" => "h", "u" => "r", "q" => "k",
  "w"=>"i","i" => "s", "v" => "c", "l"=>"b", "n"=>"u",
 "s"=>"p", "k"=>"n", "j"=>"o", "h"=>"l", "o"=>"g", "a"=>"x", "e"=>"v", "y"=>"m",
"t" => "y", "x"=>"f", "c"=>"w"}
# contents.each_char
def decrypt_with_letter_replacement(encrypted_text, replacement_map)
  decrypted_text = ""
  encrypted_text.each_char do |c|
    replacement_character = replacement_map[c]
    replacement_character.nil? ? decrypted_text += c : decrypted_text += replacement_character.upcase
  end
  decrypted_text
end
p contents
p decrypt_with_letter_replacement(contents, replacements)
