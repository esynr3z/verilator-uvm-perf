//-------------------------------------------------------------------------
//						mem_write_read_test - www.verificationguide.com
//-------------------------------------------------------------------------
class mem_rand_test extends mem_model_base_test;

  `uvm_component_utils(mem_rand_test)

  //---------------------------------------
  // sequence instance
  //---------------------------------------
  mem_sequence seq;

  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name = "mem_rand_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new

  //---------------------------------------
  // build_phase
  //---------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create the sequence
    seq = mem_sequence::type_id::create("seq");
    $value$plusargs("NUM_REQUESTS=%d", seq.num_requests);
  endfunction : build_phase

  //---------------------------------------
  // run_phase - starting the test
  //---------------------------------------
  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
    seq.start(env.mem_agnt.sequencer);
    phase.drop_objection(this);

  endtask : run_phase

endclass : mem_rand_test
