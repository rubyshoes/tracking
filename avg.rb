def average numbers
	puts 'type in some numbers'
	numbers = []
	ent = 0
	while ent != ""
		ent = gets.chomp
		numbers.push ent
		sze = numbers.size
		add = numbers[0].to_i + numbers[1].to_i + numbers[2].to_i + numbers[3].to_i
		sze = sze.to_i - 1
	end
  puts numbers
  puts sze
  puts add.to_f
  avg = (add.to_f/sze.to_f)
  puts avg
  if avg == 5.00 or 5.50 or 7.50 or 10.00
  		return true
  	else
  		return false
  end
end
puts average([5])
puts average([5, 10])
puts average([5, 10, 15])
puts average([5, 6])