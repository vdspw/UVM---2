// UVM object 

`include "uvm_macros.svh"  // include the macros 
import uvm_pkg::*;		   // include the package (UVM)
 
class obj extends uvm_object; // inherit properties from the uvm_object
  `uvm_object_utils(obj)      // factory registration of this obj 
 
  function new(string path = "obj"); // constructor
    super.new(path);
  endfunction
  
  rand bit [3:0] a; // int data "a" for randomization 
  
endclass
 
module tb;
  obj o; // instance of the class 
  
  initial begin
    o = new("obj"); // new function to allot memory 
    o.randomize(); // calling the randomize method
    `uvm_info("TB_TOP", $sformatf("Value of a : %0d", o.a), UVM_NONE);// uvm_none is the verbosity or severity prints everything 
  end
  
endmodule
