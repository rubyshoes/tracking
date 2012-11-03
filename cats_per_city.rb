def cats_per_city

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
	cat2[2] = "Durban"
	cat2[3] = 2

	cat3 = Hash.new
	cat3[1] = "Bubbles"
	cat3[2] = "Poplar"
	cat3[3] = 7

	cnt = cat.values.inject(Hash.new(0)) do |collection, value|
					collection["Durban"] +=1
					collection
		  end
	puts cnt
end
cats_per_city == 2