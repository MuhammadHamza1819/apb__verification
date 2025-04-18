/////////////////////////////////////////////////base_test//////////////////////


class base_seq extends uvm_sequence#(seq_item);
  seq_item req;
  `uvm_object_utils(base_seq)
  
  function new (string name = "base_seq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
    `uvm_do_with(req, {req.PADDR <= 50;});
  endtask
endclass


///////////directed_test/////////////////////////////


class directed_seq extends uvm_sequence#(seq_item);
  seq_item req;
  `uvm_object_utils(directed_seq)
  
  function new(string name = "directed_seq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "Running Directed Sequence", UVM_LOW);

    req = seq_item::type_id::create("req");

    // Assign all required fields
    req.PADDR   = 32'h10;
    req.PWDATA  = 32'h20;


    start_item(req);
    finish_item(req);
  endtask
endclass


///////////////////////error response test/////////////////////////////////////////////////////

class error_resp_seq extends uvm_sequence#(seq_item);
  seq_item req;
  `uvm_object_utils(error_resp_seq)
  
  function new (string name = "error_resp_test");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "error sequence : Inside Body", UVM_LOW);
    `uvm_do_with(req, {req.PADDR >= 64;});
  endtask
endclass