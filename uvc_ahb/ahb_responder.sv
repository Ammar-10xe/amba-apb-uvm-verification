// Discription: APB Responder
class ahb_responder extends uvm_driver;
        `uvm_component_utils(ahb_responder)
        
        virtual ahb_interface vif;
        // Constructor
        function new(string name = "ahb_responder", uvm_component parent = null);
                super.new(name, parent);
        endfunction
        
        // Build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction
        
        function void connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                assert(uvm_config_db#(virtual ahb_interface)::get(this,"", "vif", vif))
                else `uvm_error(get_full_name(), "unable to get the virtual interface handle") 
        endfunction

        // Run phase
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask

endclass
