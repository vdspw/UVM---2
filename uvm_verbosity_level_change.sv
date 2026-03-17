// UVM reporting macros -- Verbosity changing
// the function used to change this is :
//set_report_id_verbosity("class name",desired verbosity)

`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package

//////////////////////////////////////////////////
class driver extends uvm_driver; // extending from uvm_driver
  `uvm_component_utils(driver)   // having it as uvm_component
  
  function new(string path , uvm_component parent); //constructor
    super.new(path, parent);
  endfunction
 
  
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask
  
endclass
 
////////////////////
 
 
module tb;
  
 driver drv; // instance of the driver
 
  
  
 initial begin
   drv = new("DRV", null);
   drv.set_report_id_verbosity("DRV1",UVM_HIGH); // setting the verbosity of DRV1 to be UVM_high (300)
   drv.run();
 
    
  end
  
  
endmodule
 
 
