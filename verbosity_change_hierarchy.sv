// UVM reporting macros -- Verbosity changing --of individual components from the hierarchy
// the function used to change this is :
//class name.set_report_id_verbosity("class name",desired verbosity)

`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package

//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
  
  task run();
    `uvm_info("DRV", "Executed Driver Code", UVM_HIGH);
  endtask
  
endclass
///////////////////////////////////////////////////
 
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
  
  task run();
    `uvm_info("MON", "Executed Monitor Code", UVM_HIGH);
  endtask
  
endclass
 
//////////////////////////////////////////////////
 
class env extends uvm_env;
  `uvm_component_utils(env)
  
  driver drv; // instance of driver
  monitor mon; // instance of monitor
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  
  
  task run();
    drv = new("DRV", this);
    mon = new("MON", this);
    drv.run();
    mon.run();
  endtask
  
endclass
////////////////////
 
 
module tb;
  
 
 env e;
  
  
 initial begin
   e  = new("ENV", null);
   e.set_report_verbosity_level_hier(UVM_HIGH); // changing the verbosity in env changes in all the other components
   e.run(); 
  end
  
  
endmodule
