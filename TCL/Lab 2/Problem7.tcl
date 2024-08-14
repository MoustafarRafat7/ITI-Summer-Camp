#Problem7
set numbers {0 0 1 1 2 2 3 3}
set length [llength $numbers]
set new_list {}
for {set var 0} {$var < $length} {incr var 2} {
lappend new_list [list [lindex $numbers $var] [lindex $numbers [expr {$var + 1}] ] ]
}
puts $new_list