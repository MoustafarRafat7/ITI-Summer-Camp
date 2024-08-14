#Problem6
proc ALU { {a 100} {b 50} } {
set sum [expr $a+$b]
puts "Sum=$sum"
set sub [expr $a-$b]
puts "Sub=$sub"
set mul [expr $a*$b]
puts "mul=$mul"
set div [expr $a/$b]
puts "div=$div"
return $div  
}

puts [ALU 20 15] 
puts [ALU 20.0 15] 
puts [ALU]
