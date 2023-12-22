//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
`include "uvm_macros.svh"
import uvm_pkg::*;
//---------------------------------------------------------------
//including interfcae and testcase files
`include "mem_interface.sv"
`include "mem_base_test.sv"
`include "mem_wr_rd_test.sv"
`include "mem_rand_test.sv"
//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;

  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;

  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #5 reset = 0;
  end

  //---------------------------------------
  //interface instance
  //---------------------------------------
  mem_if intf(clk,reset);

  //---------------------------------------
  //DUT instance
  //---------------------------------------
  logic [15:0] addr;
  logic                  wr_en;
  logic                  rd_en;
  logic [31:0] wdata;
  logic [31:0] rdata;

  assign addr = intf.addr;
  assign wr_en = intf.wr_en;
  assign rd_en = intf.rd_en;
  assign wdata = intf.wdata;
  assign intf.rdata = rdata;

  memory DUT (
    .clk(clk),
    .reset(reset),
    .addr(addr),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .wdata(wdata),
    .rdata(rdata)
   );

  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method
  //and enabling the wave dump
  //---------------------------------------
  initial begin
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","vif",intf);
  end

  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin
    run_test();
  end

  initial begin
    `ifdef WAVES
    $dumpfile("dump.vcd");
    $dumpvars(0, tbench_top);
    `endif  // WAVES
  end

endmodule
