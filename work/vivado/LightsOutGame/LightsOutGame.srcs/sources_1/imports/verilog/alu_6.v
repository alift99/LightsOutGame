/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_6 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg [2:0] zvn
  );
  
  
  
  wire [16-1:0] M_adderModule_out;
  wire [1-1:0] M_adderModule_z;
  wire [1-1:0] M_adderModule_v;
  wire [1-1:0] M_adderModule_n;
  reg [16-1:0] M_adderModule_a;
  reg [16-1:0] M_adderModule_b;
  reg [6-1:0] M_adderModule_alufn;
  adder_12 adderModule (
    .a(M_adderModule_a),
    .b(M_adderModule_b),
    .alufn(M_adderModule_alufn),
    .out(M_adderModule_out),
    .z(M_adderModule_z),
    .v(M_adderModule_v),
    .n(M_adderModule_n)
  );
  
  wire [16-1:0] M_booleanModule_out;
  reg [16-1:0] M_booleanModule_a;
  reg [16-1:0] M_booleanModule_b;
  reg [6-1:0] M_booleanModule_alufn;
  boolean_13 booleanModule (
    .a(M_booleanModule_a),
    .b(M_booleanModule_b),
    .alufn(M_booleanModule_alufn),
    .out(M_booleanModule_out)
  );
  
  wire [16-1:0] M_compareModule_out;
  reg [1-1:0] M_compareModule_z;
  reg [1-1:0] M_compareModule_v;
  reg [1-1:0] M_compareModule_n;
  reg [6-1:0] M_compareModule_alufn;
  compare_14 compareModule (
    .z(M_compareModule_z),
    .v(M_compareModule_v),
    .n(M_compareModule_n),
    .alufn(M_compareModule_alufn),
    .out(M_compareModule_out)
  );
  
  wire [16-1:0] M_inverterModule_out;
  reg [16-1:0] M_inverterModule_state;
  reg [16-1:0] M_inverterModule_button_pressed;
  state_inverter_15 inverterModule (
    .state(M_inverterModule_state),
    .button_pressed(M_inverterModule_button_pressed),
    .out(M_inverterModule_out)
  );
  
  reg z;
  
  reg v;
  
  reg n;
  
  reg [15:0] tempOut;
  
  always @* begin
    M_adderModule_alufn = alufn;
    M_adderModule_a = a;
    M_adderModule_b = b;
    z = M_adderModule_z;
    v = M_adderModule_v;
    n = M_adderModule_n;
    zvn[0+0-:1] = z;
    zvn[1+0-:1] = v;
    zvn[2+0-:1] = n;
    M_compareModule_alufn = alufn;
    M_compareModule_z = z;
    M_compareModule_v = v;
    M_compareModule_n = n;
    M_booleanModule_alufn = alufn;
    M_booleanModule_a = a;
    M_booleanModule_b = b;
    M_inverterModule_state = a;
    M_inverterModule_button_pressed = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        tempOut = M_adderModule_out;
      end
      2'h1: begin
        tempOut = M_booleanModule_out;
      end
      2'h2: begin
        tempOut = M_inverterModule_out;
      end
      2'h3: begin
        tempOut = M_compareModule_out;
      end
      default: begin
        tempOut = 16'h0000;
      end
    endcase
    out = tempOut;
  end
endmodule
