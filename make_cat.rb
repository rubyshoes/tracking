def make_cat(cat_name, home_city, age)
	cat = Hash.new
	cat[1] = "Rubyshoes"
	cat[2] = "Durban"
	cat[3] = 22

	puts cat

end

make_cat "Cat name", "Home city", "age"
puts
make_cat("Breakfast", "San Francisco", 10) == {
	"name" => "Breakfast",
	"home_city" => "San Francisco",
	"age" => 10
}


