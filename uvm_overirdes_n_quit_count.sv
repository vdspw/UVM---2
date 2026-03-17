/* Override the UVM_WARNING action to make quit_count equal to the number of times UVM_WARNING executes. 
Write an SV code to send four random messages to a terminal with potential error severity, 
Simulation must stop as soon as we reach to quit_count of four. Do not use UVM_INFO, UVM_ERROR, UVM_FATAL, */

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
     `uvm_warning("DRV", "Potential Error - Attempt 1")
    `uvm_warning("DRV", "Potential Error - Attempt 2")
    `uvm_warning("DRV", "Potential Error - Attempt 3")
    
    #10; 
    // This 4th warning will trigger the quit_count threshold and stop simulation
    `uvm_warning("DRV", "Potential Error - Attempt 4")
    `uvm_warning("DRV", "This message should not appear")
	
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module tb;
  driver d;
  
  initial begin
    d = new("DRV", null);
    d.set_report_max_quit_count(4); // setting max quit count to 4
    d.set_report_severity_action(UVM_WARNING, UVM_DISPLAY | UVM_COUNT);
    // default is uvm_display, count is added to know the quit count
    // here overriding the warning to include count
    d.run();
  end
  
  
  
endmodule
