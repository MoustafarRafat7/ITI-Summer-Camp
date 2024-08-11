set x 7
set i 1
while {1} {
  if {$i == 4} {
  incr i
    continue
  }
  if { $i == 10 } {
    break
  }
  puts "multiples = [expr 7*$i]"
  incr i