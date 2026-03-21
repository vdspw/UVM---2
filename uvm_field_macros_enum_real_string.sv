// UVM field Macros -- enum , real , string 

`include "uvm_macros.svh"  // include the uvm_macros
import uvm_pkg::*;         // import the uvm package
 
class obj extends uvm_object;  //inherit the properties of the uvm_object 
//  `uvm_object_utils(obj)
 
  typedef enum bit [1:0] {s0 , s1, s2, s3} state_type;
  rand state_type state;
  
  real temp = 12.34;
  string str = "UVM";
 
  
  function new(string path = "obj"); // constructor
    super.new(path);
  endfunction
  
  `uvm_object_utils_begin(obj) // to utilize the uvm defaults
  `uvm_field_enum(state_type, state, UVM_DEFAULT); // (data type, name , uvm_default)
  `uvm_field_string(str,UVM_DEFAULT); // (arg name, uvm_default-flag)
  `uvm_field_real(temp, UVM_DEFAULT); // ( arg name, flag)
  `uvm_object_utils_end
 
  
endclass
 
module tb;
  obj o; // instance of the class
  
   initial begin
    o = new("obj");
    o.randomize();
    o.print(uvm_default_table_printer);
  end
  
  
endmodule
