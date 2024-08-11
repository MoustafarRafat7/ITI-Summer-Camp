set numbers {16 25 36 49}
foreach i $numbers {
  puts "###################################"
  puts "Sqrt:[expr $i**0.5] Value:[expr $i] Square:[expr $i**2] Cubic:[expr $i**3]"
  puts "###################################"
  puts "\n"
}