class ahb_coverage extends uvm_subscriber#(ahb_transaction);
        `uvm_component_utils(ahb_coverage)

        function new(string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction
        
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction
        
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask

        function void write(ahb_transaction t);
        endfunction
endclass
