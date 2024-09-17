create_clock -name CLK -period 3  [ge]
set_clock_uncertainty 2 [get_clocks]
set_clock_latency 1 -clock CLK
set_clock_transition rise 0.5 -clock CLK

