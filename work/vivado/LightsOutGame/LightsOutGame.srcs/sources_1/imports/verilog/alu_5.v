/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_5 (
    input [15:0] state,
    input [15:0] button_pressed,
    output reg [15:0] out,
    output reg game_over
  );
  
  
  
  wire [16-1:0] M_inverter_module_out;
  reg [16-1:0] M_inverter_module_state;
  reg [16-1:0] M_inverter_module_button_pressed;
  state_inverter_10 inverter_module (
    .state(M_inverter_module_state),
    .button_pressed(M_inverter_module_button_pressed),
    .out(M_inverter_module_out)
  );
  
  reg [15:0] new_state;
  
  always @* begin
    M_inverter_module_state = state;
    M_inverter_module_button_pressed = button_pressed;
    new_state = M_inverter_module_out;
    game_over = (&state);
    out = new_state;
  end
endmodule
