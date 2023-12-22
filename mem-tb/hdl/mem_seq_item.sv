//-------------------------------------------------------------------------
//						mem_seq_item - www.verificationguide.com
//-------------------------------------------------------------------------

class mem_seq_item extends uvm_sequence_item;
  //---------------------------------------
  //data and control fields
  //---------------------------------------
  rand bit [15:0] addr;
  rand bit       wr_en;
  rand bit       rd_en;
  rand bit [31:0] wdata;
       bit [31:0] rdata;

  //---------------------------------------
  //Utility and Field macros
  //---------------------------------------
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wr_en,UVM_ALL_ON)
    `uvm_field_int(rd_en,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
    `uvm_field_int(rdata,UVM_ALL_ON)
  `uvm_object_utils_end

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction

endclass
