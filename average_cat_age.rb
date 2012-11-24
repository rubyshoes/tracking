def average_cat_age(cats)

	cat = Hash.new
	cat[1] = "Rubyshoes"
	cat[2] = "Durban"
	cat[3] = 22

	cat1 = Hash.new
	cat1[1] = "DaintyToes"
	cat1[2] = "Joburg"
	cat1[3] = 5

	cat2 = Hash.new
	cat2[1]	= "St Whisker"
	cat2[2] = "Ashland"
	cat2[3] = 2

	cat3 = Hash.new
	cat3[1] = "Bubbles"
	cat3[2] = "Poplar"
	cat3[3] = 7

	add = cat[3].to_i + cat1[3].to_i + cat2[3].to_i + cat3[3].to_i

	puts
	avg = add.to_f/4
	puts
	puts "The average age of the four cats is, #{avg} "
	puts
	puts cat.keys.inspect
	puts
	puts cat.values.inspect
	#grouped = cat.group_by {|cat| cat["Durban"]}
	#grouped.map {|k,v| [k, v.length]}
	puts

	avgg = [cat[3].to_i+cat1[3].to_i+cat2[3].to_i+cat3[3].to_i]
	puts
	puts avgg
	puts
	#avggg = avgg.to_f/4
	puts
end
average_cat_age(4)