/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [1-1:0] M_button_detector_out;
  reg [1-1:0] M_button_detector_in;
  edge_detector_2 button_detector (
    .clk(clk),
    .in(M_button_detector_in),
    .out(M_button_detector_out)
  );
  
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_3 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  
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
  
  wire [2-1:0] M_diff_control_hidden_turns;
  wire [2-1:0] M_diff_control_difficulty;
  reg [1-1:0] M_diff_control_update_difficulty;
  reg [1-1:0] M_diff_control_update_move;
  difficulty_level_control_4 diff_control (
    .clk(clk),
    .rst(rst),
    .update_difficulty(M_diff_control_update_difficulty),
    .update_move(M_diff_control_update_move),
    .hidden_turns(M_diff_control_hidden_turns),
    .difficulty(M_diff_control_difficulty)
  );
  
  wire [16-1:0] M_alu_machine_out;
  wire [1-1:0] M_alu_machine_game_over;
  wire [48-1:0] M_alu_machine_led_data;
  reg [16-1:0] M_alu_machine_state;
  reg [16-1:0] M_alu_machine_button_pressed;
  alu_5 alu_machine (
    .state(M_alu_machine_state),
    .button_pressed(M_alu_machine_button_pressed),
    .out(M_alu_machine_out),
    .game_over(M_alu_machine_game_over),
    .led_data(M_alu_machine_led_data)
  );
  
  wire [16-1:0] M_initial_states_out;
  reg [1-1:0] M_initial_states_update_state;
  initial_board_states_6 initial_states (
    .clk(clk),
    .rst(rst),
    .update_state(M_initial_states_update_state),
    .out(M_initial_states_out)
  );
  
  wire [7-1:0] M_move_counter_module_seg_out;
  wire [4-1:0] M_move_counter_module_sel_out;
  reg [1-1:0] M_move_counter_module_inc;
  reg [1-1:0] M_move_counter_module_reset_counter;
  reg [4-1:0] M_move_counter_module_difficulty;
  move_counter_7 move_counter_module (
    .clk(clk),
    .rst(rst),
    .inc(M_move_counter_module_inc),
    .reset_counter(M_move_counter_module_reset_counter),
    .difficulty(M_move_counter_module_difficulty),
    .seg_out(M_move_counter_module_seg_out),
    .sel_out(M_move_counter_module_sel_out)
  );
  
  reg [15:0] M_board_state_d, M_board_state_q = 16'h37ff;
  
  
  localparam IN_GAME_game_state = 1'd0;
  localparam GAME_OVER_game_state = 1'd1;
  
  reg M_game_state_d, M_game_state_q = IN_GAME_game_state;
  
  always @* begin
    M_game_state_d = M_game_state_q;
    M_board_state_d = M_board_state_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_button_cond_in = io_button[1+0-:1];
    M_button_detector_in = M_button_cond_out;
    M_reset_btn_cond_in = io_button[0+0-:1];
    M_reset_btn_detector_in = M_reset_btn_cond_out;
    M_diff_btn_cond_in = io_button[2+0-:1];
    M_diff_btn_detector_in = M_diff_btn_cond_out;
    M_initial_states_update_state = 1'h0;
    M_move_counter_module_inc = 1'h0;
    M_move_counter_module_reset_counter = 1'h0;
    M_diff_control_update_difficulty = 1'h0;
    M_diff_control_update_move = 1'h0;
    M_move_counter_module_difficulty = M_diff_control_difficulty;
    
    case (M_game_state_q)
      IN_GAME_game_state: begin
        io_led[16+7+0-:1] = 1'h0;
        if (M_button_detector_out) begin
          M_move_counter_module_inc = 1'h1;
          M_diff_control_update_move = 1'h1;
          M_alu_machine_button_pressed[0+7-:8] = io_dip[0+0+7-:8];
          M_alu_machine_button_pressed[8+7-:8] = io_dip[8+0+7-:8];
          M_alu_machine_state = M_board_state_q;
          M_board_state_d = M_alu_machine_out;
          if (M_alu_machine_game_over) begin
            M_game_state_d = GAME_OVER_game_state;
          end
        end else begin
          M_alu_machine_button_pressed = 16'h0000;
          M_alu_machine_state = M_board_state_q;
        end
        if (M_reset_btn_detector_out) begin
          M_initial_states_update_state = 1'h1;
          M_board_state_d = M_initial_states_out;
          M_move_counter_module_reset_counter = 1'h1;
        end
        if (M_diff_btn_detector_out) begin
          M_diff_control_update_difficulty = 1'h1;
        end
      end
      GAME_OVER_game_state: begin
        io_led[16+7+0-:1] = 1'h1;
        if (M_reset_btn_detector_out) begin
          M_initial_states_update_state = 1'h1;
          M_board_state_d = M_initial_states_out;
          M_move_counter_module_reset_counter = 1'h1;
        end
      end
    endcase
    if (M_diff_control_hidden_turns == 1'h0) begin
      io_led[0+0+7-:8] = M_board_state_q[0+7-:8];
      io_led[8+0+7-:8] = M_board_state_q[8+7-:8];
    end else begin
      io_led[0+0+7-:8] = 8'h00;
      io_led[8+0+7-:8] = 8'h00;
      io_led[16+0+7-:8] = 8'h00;
    end
    io_seg = M_move_counter_module_seg_out;
    io_sel = M_move_counter_module_sel_out;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_game_state_q <= 1'h0;
    end else begin
      M_game_state_q <= M_game_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_board_state_q <= 16'h37ff;
    end else begin
      M_board_state_q <= M_board_state_d;
    end
  end
  
endmodule
