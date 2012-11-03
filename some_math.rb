puts 'exponential'
puts 5**2
puts ''
puts 'sqr root'
puts 5**0.5
puts ''
puts 'integer division'
puts 7/3
puts ''
puts 'modulus'
puts 7%3
puts 365%7
puts ''
puts'absolute'
puts ((2-5).abs)
puts 'random numbers'
puts rand
puts rand
puts (rand(200))
puts (rand(1))
puts (rand(9999999999999999999999999999999999999999))
puts ('The weatherman said theis is a ' + rand(101).to_s + ' % chance of rain,')
puts ('but we, including weatherman, are fallible')
puts ''
puts 'getting rand to return the same random number ... need to set the "seed"'
puts 'if we want to go back to random numbers we just seed with srand 0'
srand 1267
puts (rand(111))
puts (rand(111))
puts (rand(111))
puts ''
srand 1267
puts (rand(111))
puts (rand(111))
puts (rand(111))
srand 0
puts (rand(111))
puts (rand(111))
puts (rand(111))
puts ''
puts 'math object'
puts (Math::PI)
puts (Math::E)
puts (Math.cos(Math::PI/3))
puts (Math.tan(Math::PI/4))
puts (Math.log(Math::E**2))
puts ((1 + Math.sqrt(5))/2)