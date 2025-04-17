class ahb_monitor extends uvm_monitor;
        `uvm_component_utils(ahb_monitor)
        
        virtual ahb_interface vif;

        function new(string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction
        
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction
        
        function void connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                assert(uvm_config_db#(virtual ahb_interface)::get(this,"", "vif", vif))
                else `uvm_error(get_full_name(), "unable to get the virtual interface handle") 
        endfunction

        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask
        
endclass
