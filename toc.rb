width = 60
title = 'table of contents'
puts title.upcase.center(width)
l1 = 'Chapter 1:'
l1a = 'Numbers'
l1b = 'page 1'
l2 = 'Chapter 2:'
l2a = 'Letters'
l2b = 'page 72'
l3 = 'Chapter 3:'
l3a = 'Variables'
l3b = 'page 118'
puts l1.ljust(width/3) + l1a.center(width/3) + l1b.rjust(width/3)
puts l2.ljust(width/3) + l2a.center(width/3) + l2b.rjust(width/3)
puts l3.ljust(width/3) + l3a.center(width/3) + l3b.rjust(width/3)