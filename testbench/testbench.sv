`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "base_test.sv"

module tb_top;
  bit PCLK;
  bit PRESETn;
  always #2 PCLK = ~PCLK;
  
  initial begin
    //clk = 0;
    PRESETn = 0;
    #5; 
    PRESETn = 1;
  end
  apb_if vif(PCLK, PRESETn);
  
  apb_sram DUT
  (
   .PCLK(vif.PCLK),
   .PRESETn(vif.PRESETn),
   .PSEL(vif.PSEL),
   .PENABLE(vif.PENABLE),
   .PWRITE(vif.PWRITE),
   .PADDR(vif.PADDR),
   .PWDATA(vif.PWDATA),
   .PRDATA(vif.PRDATA),
   .PREADY(vif.PREADY),
   .PSLVERR(vif.PSLVERR)
   
  );
  
  initial begin
    // set interface in config_db
    uvm_config_db#(virtual apb_if)::set(uvm_root::get(), "*", "vif", vif);
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  initial begin
//     run_test("base_test");
    run_test("directed_test");
//     run_test("error_resp_test");

  end

covergroup cg;
    coverpoint vif.PADDR {
    	bins one = {1};
    	bins ten = {10};
    }
  endgroup

  // Stimulus : Simply randomize mode to have different values and
  // manually sample each time
  initial begin
    cg cg_inst = new();
    // for (int i = 0; i < 5; i++) begin
	  // #10 mode = $random;
    //   $display ("[%0t] mode = 0x%0h", $time, mode);
      cg_inst.sample();
    // end
    // $display ("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
  end
endmodule