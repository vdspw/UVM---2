// UVM reporting macros -- uvm_info used to print variable values without automation , can be done using  $sformatf.

`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package
 
 
 
module tb;
  
  int data = 56;
  
  initial begin
   `uvm_info("TB_TOP", $sformatf("Value of data : %0d",data), UVM_NONE);
  end
  
  // to send data to uvm_info without automation use $sformatf ( built in system function to print a formatted string ) 
  
endmodule
