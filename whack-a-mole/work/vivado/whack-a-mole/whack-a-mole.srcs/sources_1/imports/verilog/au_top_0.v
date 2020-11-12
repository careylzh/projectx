/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
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
    input b1_press,
    input b2_press,
    input b3_press,
    output reg b1_light,
    output reg b2_light,
    output reg b3_light
  );
  
  
  
  reg rst;
  
  wire [8-1:0] M_gameFsmInstance_io_seg;
  wire [4-1:0] M_gameFsmInstance_io_sel;
  reg [1-1:0] M_gameFsmInstance_b1_press;
  reg [1-1:0] M_gameFsmInstance_b2_press;
  reg [1-1:0] M_gameFsmInstance_b3_press;
  gamefsm_1 gameFsmInstance (
    .clk(clk),
    .rst(rst),
    .b1_press(M_gameFsmInstance_b1_press),
    .b2_press(M_gameFsmInstance_b2_press),
    .b3_press(M_gameFsmInstance_b3_press),
    .io_seg(M_gameFsmInstance_io_seg),
    .io_sel(M_gameFsmInstance_io_sel)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_b1_press_cond_out;
  reg [1-1:0] M_b1_press_cond_in;
  button_conditioner_3 b1_press_cond (
    .clk(clk),
    .in(M_b1_press_cond_in),
    .out(M_b1_press_cond_out)
  );
  wire [1-1:0] M_b2_press_cond_out;
  reg [1-1:0] M_b2_press_cond_in;
  button_conditioner_3 b2_press_cond (
    .clk(clk),
    .in(M_b2_press_cond_in),
    .out(M_b2_press_cond_out)
  );
  wire [1-1:0] M_b3_press_cond_out;
  reg [1-1:0] M_b3_press_cond_in;
  button_conditioner_3 b3_press_cond (
    .clk(clk),
    .in(M_b3_press_cond_in),
    .out(M_b3_press_cond_out)
  );
  wire [1-1:0] M_buttondetector1_out;
  reg [1-1:0] M_buttondetector1_in;
  edge_detector_4 buttondetector1 (
    .clk(clk),
    .in(M_buttondetector1_in),
    .out(M_buttondetector1_out)
  );
  wire [1-1:0] M_buttondetector2_out;
  reg [1-1:0] M_buttondetector2_in;
  edge_detector_4 buttondetector2 (
    .clk(clk),
    .in(M_buttondetector2_in),
    .out(M_buttondetector2_out)
  );
  wire [1-1:0] M_buttondetector3_out;
  reg [1-1:0] M_buttondetector3_in;
  edge_detector_4 buttondetector3 (
    .clk(clk),
    .in(M_buttondetector3_in),
    .out(M_buttondetector3_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = M_gameFsmInstance_io_seg;
    io_sel = M_gameFsmInstance_io_sel;
    M_b1_press_cond_in = b1_press;
    M_b2_press_cond_in = b2_press;
    M_b3_press_cond_in = b3_press;
    M_buttondetector1_in = M_b1_press_cond_out;
    M_buttondetector2_in = M_b2_press_cond_out;
    M_buttondetector3_in = M_b3_press_cond_out;
    b1_light = 1'h1;
    b2_light = 1'h0;
    b3_light = 1'h1;
    M_gameFsmInstance_b1_press = 1'h1;
    M_gameFsmInstance_b2_press = 1'h1;
    M_gameFsmInstance_b3_press = 1'h1;
    io_led[0+0+0-:1] = M_buttondetector1_out;
    io_led[0+2+0-:1] = M_buttondetector2_out;
    io_led[0+4+0-:1] = M_buttondetector3_out;
  end
endmodule
