// UVM reporting macros

`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package
 
 
 
module tb;
  
  initial begin
    #50;   // with this time delay , info is going to print the tim stamp 
    `uvm_info("TB_TOP","Hello World", UVM_LOW); // uvm_info(class,msg,verbosity)
     $display("Hello World with Display");
  end
  
  
  
endmodule
