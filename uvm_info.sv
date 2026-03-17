/* sending the name of RTL */
// UVM reporting macros

`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package
 
 
 
module tb;
  
  initial begin
      #10; // ads time stamp to the uvm_info message
    `uvm_info("TB_TOP", "First RTL : Your_System_Name", UVM_LOW); // 			uvm_info(class,msg,verbosity)
    
  end
  
  
  
endmodule
