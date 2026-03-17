// UVM reporting macros -- uvm_info , uvm_warning, uvm_error, 
// uvm_fatal -> stops simulation instantly after it sends the data to the console.

`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
 
  
  
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
     #10;
    `uvm_fatal("DRV", "Simulation cannot continue"); // simulation stops after 10 ns in this case
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module tb;
  driver d;
  
  initial begin
    d = new("DRV", null);
    d.run();
  end
  
  
  
endmodule
