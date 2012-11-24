puts "Type in as many words as you want. When you are done, press \'Enter'\ on the next line."
# array for the entries
words = []
entry = "0"
# taking responses and pushing them into the array
while entry != ""
entry = gets.chomp
words.push entry
end
# displaying data
puts "Thanks for your input. Sorting data ..."
puts words.sort 
puts words.length
words.each do |wrd|
#	puts 'inside ' + wrd + ''
	puts wrd
# populate array with 100 no'
	100.times do
		cats = ["no"]
		puts cats
	end
end