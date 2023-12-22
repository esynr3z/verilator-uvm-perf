//-------------------------------------------------------------------------
//						mem_interface - www.verificationguide.com
//-------------------------------------------------------------------------

interface mem_if(input logic clk,reset);

  //---------------------------------------
  //declaring the signals
  //---------------------------------------
  logic [15:0] addr;
  logic wr_en;
  logic rd_en;
  logic [31:0] wdata;
  logic [31:0] rdata;

endinterface
