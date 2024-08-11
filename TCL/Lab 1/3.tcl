set Performance {ABCDEG}
for {set i 0} {$i<[string length $Performance] } {incr i} {
switch [string index $Performance $i] {
  "A" {puts "employee performance during annual evaluations is Excellent"}
  "B" {puts "employee performance during annual evaluations is Very Good"}
  "C" {puts "employee performance during annual evaluations is Good"}
  "G" {puts "employee performance during annual evaluations is Normal"}
  "D" {puts "employee performance during annual evaluations is Up Normal"}
  default {puts "employee performance during annual evaluations is Bad"}
}
}

set Performance {ABCDEG}
for {set i 0} {$i<[string length $Performance] } {incr i} {
if {[string index $Performance $i] == "A"} {
puts "employee performance during annual evaluations is Excellent"} elseif {[string index $Performance $i] == "B"} {
puts "employee performance during annual evaluations is Very Good"} elseif {[string index $Performance $i] == "C"} {
puts "employee performance during annual evaluations is Good"} elseif {[string index $Performance $i] == "D"} {
puts "employee performance during annual evaluations is Normal"} elseif {[string index $Performance $i] == "G"} {
puts "employee performance during annual evaluations is Up Normal"} else {
puts "employee performance during annual evaluations is Bad"}
}
