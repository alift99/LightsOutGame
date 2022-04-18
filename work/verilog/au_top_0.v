/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input usb_rx,
    output reg usb_tx,
    output reg [3:0] led_strip,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [15:0] button,
    input reset_button,
    input difficulty_button
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [(5'h10+0)-1:0] M_button_detector_out;
  reg [(5'h10+0)-1:0] M_button_detector_in;
  
  genvar GEN_button_detector0;
  generate
  for (GEN_button_detector0=0;GEN_button_detector0<5'h10;GEN_button_detector0=GEN_button_detector0+1) begin: button_detector_gen_0
    edge_detector_2 button_detector (
      .clk(clk),
      .in(M_button_detector_in[GEN_button_detector0*(1)+(1)-1-:(1)]),
      .out(M_button_detector_out[GEN_button_detector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(5'h10+0)-1:0] M_button_cond_out;
  reg [(5'h10+0)-1:0] M_button_cond_in;
  
  genvar GEN_button_cond0;
  generate
  for (GEN_button_cond0=0;GEN_button_cond0<5'h10;GEN_button_cond0=GEN_button_cond0+1) begin: button_cond_gen_0
    button_conditioner_3 button_cond (
      .clk(clk),
      .in(M_button_cond_in[GEN_button_cond0*(1)+(1)-1-:(1)]),
      .out(M_button_cond_out[GEN_button_cond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [1-1:0] M_reset_btn_detector_out;
  reg [1-1:0] M_reset_btn_detector_in;
  edge_detector_2 reset_btn_detector (
    .clk(clk),
    .in(M_reset_btn_detector_in),
    .out(M_reset_btn_detector_out)
  );
  
  wire [1-1:0] M_reset_btn_cond_out;
  reg [1-1:0] M_reset_btn_cond_in;
  button_conditioner_3 reset_btn_cond (
    .clk(clk),
    .in(M_reset_btn_cond_in),
    .out(M_reset_btn_cond_out)
  );
  
  wire [1-1:0] M_diff_btn_detector_out;
  reg [1-1:0] M_diff_btn_detector_in;
  edge_detector_2 diff_btn_detector (
    .clk(clk),
    .in(M_diff_btn_detector_in),
    .out(M_diff_btn_detector_out)
  );
  
  wire [1-1:0] M_diff_btn_cond_out;
  reg [1-1:0] M_diff_btn_cond_in;
  button_conditioner_3 diff_btn_cond (
    .clk(clk),
    .in(M_diff_btn_cond_in),
    .out(M_diff_btn_cond_out)
  );
  
  wire [1-1:0] M_game_sm_we;
  wire [4-1:0] M_game_sm_ra;
  wire [4-1:0] M_game_sm_rb;
  wire [4-1:0] M_game_sm_rc;
  wire [1-1:0] M_game_sm_asel;
  wire [1-1:0] M_game_sm_bsel;
  wire [6-1:0] M_game_sm_alufn;
  reg [16-1:0] M_game_sm_button_pressed;
  reg [1-1:0] M_game_sm_reset_btn_pressed;
  reg [1-1:0] M_game_sm_difficulty_btn_pressed;
  reg [16-1:0] M_game_sm_initial_board_index;
  reg [16-1:0] M_game_sm_move_count_1;
  reg [16-1:0] M_game_sm_difficulty_level;
  reg [16-1:0] M_game_sm_hidden_turns_left;
  reg [16-1:0] M_game_sm_game_over;
  game_fsm_4 game_sm (
    .clk(clk),
    .rst(rst),
    .button_pressed(M_game_sm_button_pressed),
    .reset_btn_pressed(M_game_sm_reset_btn_pressed),
    .difficulty_btn_pressed(M_game_sm_difficulty_btn_pressed),
    .initial_board_index(M_game_sm_initial_board_index),
    .move_count_1(M_game_sm_move_count_1),
    .difficulty_level(M_game_sm_difficulty_level),
    .hidden_turns_left(M_game_sm_hidden_turns_left),
    .game_over(M_game_sm_game_over),
    .we(M_game_sm_we),
    .ra(M_game_sm_ra),
    .rb(M_game_sm_rb),
    .rc(M_game_sm_rc),
    .asel(M_game_sm_asel),
    .bsel(M_game_sm_bsel),
    .alufn(M_game_sm_alufn)
  );
  
  wire [16-1:0] M_regfile_machine_read_data_1;
  wire [16-1:0] M_regfile_machine_read_data_2;
  wire [16-1:0] M_regfile_machine_board_state;
  wire [16-1:0] M_regfile_machine_initial_board_state_index;
  wire [16-1:0] M_regfile_machine_move_count_1;
  wire [16-1:0] M_regfile_machine_move_count_2;
  wire [16-1:0] M_regfile_machine_difficulty_level;
  wire [16-1:0] M_regfile_machine_hidden_turns_left;
  wire [16-1:0] M_regfile_machine_game_over;
  reg [4-1:0] M_regfile_machine_read_address_1;
  reg [4-1:0] M_regfile_machine_read_address_2;
  reg [4-1:0] M_regfile_machine_write_address;
  reg [16-1:0] M_regfile_machine_write_data;
  reg [1-1:0] M_regfile_machine_write_enable;
  regfile_5 regfile_machine (
    .clk(clk),
    .read_address_1(M_regfile_machine_read_address_1),
    .read_address_2(M_regfile_machine_read_address_2),
    .write_address(M_regfile_machine_write_address),
    .write_data(M_regfile_machine_write_data),
    .write_enable(M_regfile_machine_write_enable),
    .read_data_1(M_regfile_machine_read_data_1),
    .read_data_2(M_regfile_machine_read_data_2),
    .board_state(M_regfile_machine_board_state),
    .initial_board_state_index(M_regfile_machine_initial_board_state_index),
    .move_count_1(M_regfile_machine_move_count_1),
    .move_count_2(M_regfile_machine_move_count_2),
    .difficulty_level(M_regfile_machine_difficulty_level),
    .hidden_turns_left(M_regfile_machine_hidden_turns_left),
    .game_over(M_regfile_machine_game_over)
  );
  
  wire [16-1:0] M_alu_machine_out;
  wire [3-1:0] M_alu_machine_zvn;
  reg [16-1:0] M_alu_machine_a;
  reg [16-1:0] M_alu_machine_b;
  reg [6-1:0] M_alu_machine_alufn;
  alu_6 alu_machine (
    .a(M_alu_machine_a),
    .b(M_alu_machine_b),
    .alufn(M_alu_machine_alufn),
    .out(M_alu_machine_out),
    .zvn(M_alu_machine_zvn)
  );
  
  wire [16-1:0] M_initial_states_out;
  reg [16-1:0] M_initial_states_state_index;
  initial_board_states_7 initial_states (
    .state_index(M_initial_states_state_index),
    .out(M_initial_states_out)
  );
  
  wire [7-1:0] M_move_counter_module_seg_out;
  wire [4-1:0] M_move_counter_module_sel_out;
  reg [16-1:0] M_move_counter_module_move_counter_1;
  reg [16-1:0] M_move_counter_module_move_counter_2;
  reg [16-1:0] M_move_counter_module_difficulty;
  move_counter_8 move_counter_module (
    .clk(clk),
    .rst(rst),
    .move_counter_1(M_move_counter_module_move_counter_1),
    .move_counter_2(M_move_counter_module_move_counter_2),
    .difficulty(M_move_counter_module_difficulty),
    .seg_out(M_move_counter_module_seg_out),
    .sel_out(M_move_counter_module_sel_out)
  );
  
  wire [1-1:0] M_led_out_out0;
  wire [1-1:0] M_led_out_out1;
  wire [1-1:0] M_led_out_out2;
  wire [1-1:0] M_led_out_out3;
  reg [16-1:0] M_led_out_board_state;
  reg [1-1:0] M_led_out_power_on;
  led_out_9 led_out (
    .clk(clk),
    .rst(rst),
    .board_state(M_led_out_board_state),
    .power_on(M_led_out_power_on),
    .out0(M_led_out_out0),
    .out1(M_led_out_out1),
    .out2(M_led_out_out2),
    .out3(M_led_out_out3)
  );
  
  wire [16-1:0] M_asel_mux_out;
  reg [16-1:0] M_asel_mux_a;
  reg [16-1:0] M_asel_mux_b;
  reg [1-1:0] M_asel_mux_sel;
  mux2_10 asel_mux (
    .a(M_asel_mux_a),
    .b(M_asel_mux_b),
    .sel(M_asel_mux_sel),
    .out(M_asel_mux_out)
  );
  
  wire [16-1:0] M_bsel_mux_out;
  reg [16-1:0] M_bsel_mux_a;
  reg [16-1:0] M_bsel_mux_b;
  reg [1-1:0] M_bsel_mux_sel;
  mux2_10 bsel_mux (
    .a(M_bsel_mux_a),
    .b(M_bsel_mux_b),
    .sel(M_bsel_mux_sel),
    .out(M_bsel_mux_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_button_cond_in = button;
    M_button_detector_in = M_button_cond_out;
    M_reset_btn_cond_in = reset_button;
    M_reset_btn_detector_in = M_reset_btn_cond_out;
    M_diff_btn_cond_in = difficulty_button;
    M_diff_btn_detector_in = M_diff_btn_cond_out;
    M_initial_states_state_index = M_regfile_machine_initial_board_state_index;
    M_game_sm_button_pressed = M_button_detector_out;
    M_game_sm_reset_btn_pressed = M_reset_btn_detector_out;
    M_game_sm_difficulty_btn_pressed = M_diff_btn_detector_out;
    M_game_sm_initial_board_index = M_regfile_machine_initial_board_state_index;
    M_game_sm_move_count_1 = M_regfile_machine_move_count_1;
    M_game_sm_difficulty_level = M_regfile_machine_difficulty_level;
    M_game_sm_hidden_turns_left = M_regfile_machine_hidden_turns_left;
    M_game_sm_game_over = M_regfile_machine_game_over;
    M_regfile_machine_write_enable = M_game_sm_we;
    M_regfile_machine_read_address_1 = M_game_sm_ra;
    M_regfile_machine_read_address_2 = M_game_sm_rb;
    M_regfile_machine_write_address = M_game_sm_rc;
    M_asel_mux_a = M_regfile_machine_read_data_1;
    M_asel_mux_b = M_initial_states_out;
    M_asel_mux_sel = M_game_sm_asel;
    M_bsel_mux_a = M_regfile_machine_read_data_2;
    M_bsel_mux_b = M_button_detector_out;
    M_bsel_mux_sel = M_game_sm_bsel;
    M_alu_machine_a = M_asel_mux_out;
    M_alu_machine_b = M_bsel_mux_out;
    M_alu_machine_alufn = M_game_sm_alufn;
    M_regfile_machine_write_data = M_alu_machine_out;
    if (M_regfile_machine_hidden_turns_left == 1'h0 | M_regfile_machine_game_over) begin
      M_led_out_power_on = 1'h1;
    end else begin
      M_led_out_power_on = 1'h0;
    end
    M_led_out_board_state = M_regfile_machine_board_state;
    led_strip[0+0-:1] = M_led_out_out0;
    led_strip[1+0-:1] = M_led_out_out1;
    led_strip[2+0-:1] = M_led_out_out2;
    led_strip[3+0-:1] = M_led_out_out3;
    M_move_counter_module_move_counter_1 = M_regfile_machine_move_count_1;
    M_move_counter_module_move_counter_2 = M_regfile_machine_move_count_2;
    M_move_counter_module_difficulty = M_regfile_machine_difficulty_level + 1'h1;
    io_seg = M_move_counter_module_seg_out;
    io_sel = M_move_counter_module_sel_out;
  end
endmodule
