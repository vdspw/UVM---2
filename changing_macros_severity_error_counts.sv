// changing associated MACROS actions
// updating the UVM_ERROR count and quit_count

`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
 
  
  
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE); // severity action observed on this line if un-commented.
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error"); ///uvm_count
    `uvm_error("DRV", "Second Real Error");
    
     #10;
    `uvm_fatal("DRV", "Simulation cannot continue DRV1"); /// uvm_exit
    #10;
    `uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
   
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module tb;
  driver d;
  
  initial begin
    d = new("DRV", null);
    d.set_report_max_quit_count(3);
    // after 3 errors quit
    // d.set_report_severity_action(UVM_INFO,UVM_NO_ACTION);
    /* overiding the UVM_INFO with UVM_NO_ACTION , this message wont be printed on the console */
    d.run();
  end
  
  
  
endmodule
