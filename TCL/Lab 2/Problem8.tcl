set report [open "report.txt" r];
set slack_count 0;
set setup_count 0;
set modified_report [open "modified_report.txt" w];
set report_data [read $report]
set lines [split $report_data \n]
foreach line $lines {
    
    if {[regexp {slack} $line c]} {
        puts $modified_report $line
        incr slack_count;
    }
    if {[regexp {setup} $line c]} {
        puts $modified_report $line
        incr setup_count;
    }
}
puts "slack count number is $slack_count"
puts "setup count number is $setup_count"
close $modified_report;

