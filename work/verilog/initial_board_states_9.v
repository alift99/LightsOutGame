/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module initial_board_states_9 (
    input [15:0] state_index,
    output reg [15:0] out
  );
  
  
  
  localparam BOARD_STATES = 96'hd3cbc9f30ea84befc9f3be35;
  
  always @* begin
    out = BOARD_STATES[(state_index)*16+15-:16];
  end
endmodule
