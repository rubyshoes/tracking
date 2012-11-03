toc = ["Table of Contents","Chapter 1: Getting Started", "page 1",
"Chapter 2: Numbers", "page 9", "Chapter 3: Letters", "page 13"]
line_width = 60
i = 0
puts(toc[0].center(line_width))
puts ""
# loop to define when to stop putting lines for the contents.
until i == 6
puts i
puts(toc[i += 1].ljust(line_width/2) + toc[i += 1].rjust(line_width/2))
end