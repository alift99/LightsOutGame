# clk => 100000000Hz
create_clock -period 10.0 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property PACKAGE_PIN P6 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN B1 [get_ports {led_strip[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_strip[0]}]
set_property PACKAGE_PIN C1 [get_ports {led_strip[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_strip[1]}]
set_property PACKAGE_PIN E2 [get_ports {led_strip[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_strip[2]}]
set_property PACKAGE_PIN D1 [get_ports {led_strip[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_strip[3]}]
set_property PACKAGE_PIN T3 [get_ports {button[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[15]}]
set_property PACKAGE_PIN T2 [get_ports {button[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[14]}]
set_property PACKAGE_PIN R1 [get_ports {button[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[13]}]
set_property PACKAGE_PIN P1 [get_ports {button[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[12]}]
set_property PACKAGE_PIN T4 [get_ports {button[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[11]}]
set_property PACKAGE_PIN R3 [get_ports {button[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[10]}]
set_property PACKAGE_PIN R2 [get_ports {button[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[9]}]
set_property PACKAGE_PIN N1 [get_ports {button[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[8]}]
set_property PACKAGE_PIN L5 [get_ports {button[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[7]}]
set_property PACKAGE_PIN N4 [get_ports {button[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[6]}]
set_property PACKAGE_PIN M4 [get_ports {button[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[5]}]
set_property PACKAGE_PIN P3 [get_ports {button[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[4]}]
set_property PACKAGE_PIN P5 [get_ports {button[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[3]}]
set_property PACKAGE_PIN M5 [get_ports {button[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[2]}]
set_property PACKAGE_PIN L4 [get_ports {button[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[1]}]
set_property PACKAGE_PIN P4 [get_ports {button[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[0]}]
set_property PACKAGE_PIN N3 [get_ports {reset_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset_button}]
set_property PACKAGE_PIN N2 [get_ports {difficulty_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {difficulty_button}]
set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]
set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]
