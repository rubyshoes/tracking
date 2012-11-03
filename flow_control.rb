puts 'comparison methods ... greater than, less than'
puts 1 > 2
puts 1 < 2
puts ''
puts 'greater than or equal etc'
puts 5 >= 5
puts 5 <= 4
puts ''
puts 'two objects are equal or not'
puts 1 == 1
puts 2 != 1
puts ''
puts 'comparing strings ... compares their lexicographical ordering'
puts 'since capital letters are first make sure to use upcase or downcase in these comparisons'
puts 'cat' < 'dog'
puts ''
puts 'branching ... if then etc'
puts 'hello, what\'s your name?'
name = gets.chomp
puts 'hello, ' + name + '.'
if name == 'tom'
	puts 'hey ... my name is tom too'
end
puts ''
puts 'i am a fortune teller. Tell me your name:'
name = gets.chomp
if name == 'tom'
	puts 'a great future awaits you.'
else
	puts 'your future is... Oh my! Look at the time!'
	puts 'i really have to run, later'
end
puts ''
puts 'hello, and welcome to 7th grade english'
puts 'my name is mrs english. And your name is ....?'
name = gets.chomp

if name == name.capitalize
	puts 'please take a seat, ' + name + '.'
else
	puts name + '? you mean ' + name.capitalize + ', right?'
	puts 'don\'t you even know how to spell your name??'
	reply = gets.chomp

	if reply.downcase == 'yes'
		puts 'Hmmph! Well, sit down!'
	else
		puts 'GET OUT!!'
	end
end
