#Problem5
set my_list { 1 5 19 8 32}
proc replace_Insert {my_list index number} {  
puts [linsert $my_list $index $number ]
puts [lreplace $my_list $index $index $number ]  
  
}
puts [replace_Insert $my_list 1 90]
puts [replace_Insert $my_list 3 24]