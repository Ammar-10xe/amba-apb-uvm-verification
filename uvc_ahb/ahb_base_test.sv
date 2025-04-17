
class ahb_base_test extends uvm_test;
        
        // factor registration 
        `uvm_component_utils(ahb_base_test)

        ahb_env env;
        
        //constructor
        function new (string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction  
        
        // build phase
        function void build_phase (uvm_phase phase);
                super.build_phase(phase);
                env = ahb_env::type_id::create("env",this);
        endfunction

        // end of elaboration phase
        function void end_of_elaboration_phase(uvm_phase phase);
                super.end_of_elaboration_phase(phase);
                uvm_top.print_topology();
        endfunction

endclass
