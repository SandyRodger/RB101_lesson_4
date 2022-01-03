# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# hash = Hash.new

# flintstones.each_with_index do |value, idx|
# 	hash[value] = idx
# end

# p hash

# 2

# ages = { "Herman" => 32,
# 				 "Lily" => 30, 
# 				 	"Grandpa" => 5843, 
# 					"Eddie" => 10, 
# 					"Marilyn" => 22, 
# 					"Spot" => 237 
# 				}

# total = []

# ages.each_value do |v|
# 	total << v
# end

# p total.sum

#  or

# total_ages = 0

# ages.each_value { |v| total_ages += v }
# p total_ages # => 6174

# 3

# ages = { "Herman" => 32, 
# 				"Lily" => 30, 
# 				"Grandpa" => 402, 
# 				"Eddie" => 10 
# 			}

# ages.delete_if {|k, v| v >= 100 }

# p ages


# 4 

# ages = { "Herman" => 32, 
# 					"Lily" => 30, 
# 					"Grandpa" => 5843, 
# 					"Eddie" => 10, 
# 					"Marilyn" => 22, 
# 					"Spot" => 237 
# 													}

#  p ages.values.min

 # 5 

#  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#  flintstones.each_with_index do |word, idx|
# 		if word[0..1] == 'Be'	
# 			p idx 
# 		end
# 	end

# 	LS solution:

# p flintstones.index { |name| name[2, 2] == "mB" }

# 6 

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each do |word|
# 	 word.delete_suffix!(word[-1]) until word.length == 3
# end

# p flintstones

# LS solutions:

# flintstones.map! do |name|
#   name[0, 3]
# end

# flintstones.map! { |name| name[0,3] }

# 7

# statement = "The Flintstones Rock"

# def letter_count(str)
#   counts = {}

#   str.each_char do |char|
#     next if char == " "
#     counts[char] = 0 unless counts.include?(char)
#     counts[char] += 1
#   end

#   counts
# end

# p letter_count(statement)

# LS soultion:

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# 8 

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# 1 => 1, 3

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# 1 => 1, 2

# 9

# words = "the flintstones rock"

# def titleize(string)
# 	string[0] = string[0].capitalize!
# 	string.each_char do |letter|
# 		if letter == ' '
# 			letter[+1].capitalize!
# 		end
# 	end
# end

# p titleize(words)

# Problem: This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. 

# Example: 

# words = "the flintstones rock" 

# => words = "The Flintstones Rock"

# Data/Algorithm:

# 1. Loop through statement capitalizing each character preceded by a space.
# 2. Use 'next if' to identify when the character in 'each_char' is a space.


# Code:

# words = "the flintstones rock"

# def titleize(string)
# 	output_string = ''
# 	counter = 0
# 	string_as_arr = string.split
# 	string_as_arr.collect! do |word|
# 		word.capitalize!
# 	end
# 	string_as_arr.flatten
# 	loop do
# 	output_string << string_as_arr.shift
# 	break if string_as_arr.empty?
# 	output_string << ' '
# 	end
# 	output_string
# end

# p titleize(words)

# LS solution:

# words.split.map { |word| word.capitalize }.join(' ')

# 10

# Problem:

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below.

# Explicit requirements:

# 												an additional "age_group" key
# 												kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+

# Implicit requirements: I have to iterate over the hash
# 												

# Output: a hash
# Input: a hash
# Questions: What is the best ruby-method to use? each_value?

# Example:

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Data/Algorithm:

#  1. Use a Ruby in-built method to identify the age of each key.
#  2. Add the corresponding age group and move onto the next key.

# Code:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
	case details["age"]
	when 0..18	
		details["ages_group"] = "kid"
	when 18..65
		details["ages_group"] = "adult"
	else
		details["ages_group"] = "senior"
	end
end

puts munsters

