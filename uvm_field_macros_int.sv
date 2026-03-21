// UVM field Macros 

`include "uvm_macros.svh"  // include the uvm_macros
import uvm_pkg::*;         // import the uvm package
 
class obj extends uvm_object;  //inherit the properties of the uvm_object 
//  `uvm_object_utils(obj)
 
  function new(string path = "obj"); // constructor
    super.new(path);
  endfunction
  
  rand bit [3:0] a; // variable a and b with respective widths
  rand bit [7:0] b;
 
  `uvm_object_utils_begin(obj)   // macros to work on a and b 
  `uvm_field_int(a, UVM_NOPRINT | UVM_BIN); //dont show this when print method is called , if printed show in binary format
  `uvm_field_int(b, UVM_DEFAULT | UVM_DEC); // include "b" in all std operations and when printed print in decimals
  `uvm_object_utils_end
 
  
endclass
 
module tb;
  obj o; // instance of the class
  
  initial begin
    o = new("obj"); // new function allocating memory
    o.randomize();  // randomization 
    o.print(uvm_default_table_printer); // calling the print function and printing in the table format.
  end
  
endmodule
