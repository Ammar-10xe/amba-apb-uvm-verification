// Discription : axi Transaction

class axi_transaction extends uvm_sequence_item;
        
        parameter int WIDTH = 32;

        randc bit [3:0]  id;
        randc bit [WIDTH -1 :0] addr;
        randc bit [3:0]  len;
        randc bit [2:0]  size;
        randc bit [3:0]  cache;
        randc bit [2:0]  prot;
        randc bit [WIDTH -1:0] data;
        randc bit [3:0]  strobe;
        randc bit [1:0]  burst;
        randc bit [1:0]  lock;
        randc bit [1:0]  resp;


        `uvm_object_utils_begin(axi_transaction)
                `uvm_field_int(id,UVM_ALL_ON)
                `uvm_field_int(addr,UVM_ALL_ON)
                `uvm_field_int(len,UVM_ALL_ON)
                `uvm_field_int(size,UVM_ALL_ON)
                `uvm_field_int(cache,UVM_ALL_ON)
                `uvm_field_int(prot,UVM_ALL_ON)
                `uvm_field_int(data,UVM_ALL_ON)
                `uvm_field_int(strobe,UVM_ALL_ON)
                `uvm_field_int(burst,UVM_ALL_ON)
                `uvm_field_int(lock,UVM_ALL_ON)
                `uvm_field_int(resp,UVM_ALL_ON)
        `uvm_object_utils_end

        // constructor
        function new(string name = "axi_transaction");
                super.new(name);
        endfunction


endclass
