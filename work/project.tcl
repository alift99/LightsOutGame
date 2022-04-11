set projDir "D:/Alchitry\ Projects/LightsOutGame/work/vivado"
set projName "LightsOutGame"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Alchitry\ Projects/LightsOutGame/work/verilog/au_top_0.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/reset_conditioner_1.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/edge_detector_2.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/button_conditioner_3.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/difficulty_level_control_4.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/alu_5.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/initial_board_states_6.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/move_counter_7.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/pipeline_8.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/state_inverter_9.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/display_encoder_10.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/multi_seven_seg_11.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/multi_dec_ctr_12.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/counter_13.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/seven_seg_14.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/decoder_15.v" "D:/Alchitry\ Projects/LightsOutGame/work/verilog/decimal_counter_16.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Alchitry\ Projects/LightsOutGame/work/constraint/alchitry.xdc" "D:/Alchitry\ Projects/LightsOutGame/work/constraint/io.xdc" "D:/Alchitry/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
