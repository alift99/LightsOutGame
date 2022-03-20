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
  
  wire [16-1:0] M_s_inv_mod_out;
  reg [16-1:0] M_s_inv_mod_state;
  reg [16-1:0] M_s_inv_mod_button_pressed;
  state_inverter_4 s_inv_mod (
    .state(M_s_inv_mod_state),
    .button_pressed(M_s_inv_mod_button_pressed),
    .out(M_s_inv_mod_out)
  );
  
  wire [16-1:0] M_initial_states_out;
  reg [1-1:0] M_initial_states_update_state;
  initial_board_states_5 initial_states (
    .clk(clk),
    .rst(rst),
    .update_state(M_initial_states_update_state),
    .out(M_initial_states_out)
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
    M_initial_states_update_state = 1'h0;
    if ((&M_board_state_q)) begin
      M_game_state_d = GAME_OVER_game_state;
    end
    
    case (M_game_state_q)
      IN_GAME_game_state: begin
        io_led[16+7+0-:1] = 1'h1;
        if (M_button_detector_out) begin
          M_s_inv_mod_button_pressed[0+7-:8] = io_dip[0+0+7-:8];
          M_s_inv_mod_button_pressed[8+7-:8] = io_dip[8+0+7-:8];
          M_s_inv_mod_state = M_board_state_q;
          M_board_state_d = M_s_inv_mod_out;
        end else begin
          M_s_inv_mod_button_pressed = 16'h0000;
          M_s_inv_mod_state = M_board_state_q;
        end
      end
      GAME_OVER_game_state: begin
        io_led[16+7+0-:1] = 1'h0;
        if (M_button_detector_out) begin
          M_initial_states_update_state = 1'h1;
          M_board_state_d = M_initial_states_out;
          M_game_state_d = IN_GAME_game_state;
        end
      end
    endcase
    io_led[0+0+7-:8] = M_board_state_q[0+7-:8];
    io_led[8+0+7-:8] = M_board_state_q[8+7-:8];
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_board_state_q <= 16'h37ff;
    end else begin
      M_board_state_q <= M_board_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_game_state_q <= 1'h0;
    end else begin
      M_game_state_q <= M_game_state_d;
    end
  end
  
endmodule