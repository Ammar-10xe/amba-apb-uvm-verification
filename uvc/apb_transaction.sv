// Discription : APB Transaction

class apb_transaction extends uvm_sequence_item;
        
        `uvm_object_utils(apb_transaction)
        
        // constructor
        function new(string name = "apb_transaction");
                super.new(name);
        endfunction


endclass
