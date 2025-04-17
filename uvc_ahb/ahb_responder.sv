// Discription: APB Responder
class ahb_responder extends uvm_driver;
        `uvm_component_utils(ahb_responder)
        
        // Constructor
        function new(string name = "ahb_responder", uvm_component parent = null);
                super.new(name, parent);
        endfunction
        
        // Build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction
        
        // Run phase
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask

endclass
