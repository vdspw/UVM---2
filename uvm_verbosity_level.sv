// UVM reporting macros -- Verbosity 
`include "uvm_macros.svh" ///`uvm_info
import uvm_pkg::*;       // including the uvm package
 
 
 
module tb;
  
    
  initial begin
    uvm_top.set_report_verbosity_level(UVM_HIGH); // setting the verbosity to HIGH 
    $display("Default Verbosity level : %0d ", uvm_top.get_report_verbosity_level); // printing the verbosity level 
    `uvm_info("TB_TOP", "String", UVM_HIGH); // anything with 200 or below will be printed , or anything with UVM_HIGH, UVM_LOW, UVM_NONE will be printed.
  
  end
  
endmodule
