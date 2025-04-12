`define NEW_COMP\
function new(string name,uvm_component parent);\
	super.new(name,parent);\
endfunction
`define NEW_OBJ\
function new(string name="");\
	super.new(name);\
endfunction

parameter WIDTH=32;
parameter ADDR_WIDTH=32;

class apb_common;
	static int count=5;
	static int num_matches;
	static int num_mismatches;
	static bit wait_states;
endclass
