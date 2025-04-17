
class ahb_driver extends uvm_driver#(ahb_transaction);
        `uvm_component_utils(ahb_driver)
        
        function new(string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction
        
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction
        
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask

endclass
