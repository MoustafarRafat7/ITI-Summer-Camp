set x "0 1 2 3 4 5 6 7 8 9 10"
foreach i $x {
  if { $i >=0 && $i<10 } {
  puts "square: [expr $i**2 ]"
  }
}