// Description: axi driver class
class axi_driver extends uvm_driver#(axi_transaction);
        
        `uvm_component_utils(axi_driver)
        virtual axi_interface vif;
        // constructor
        function new(string name = "axi_driver", uvm_component parent = null);
                super.new(name, parent);
        endfunction

        //build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        endfunction

        //run phase
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
                assert(uvm_config_db#(virtual axi_interface)::get(this,"", "vif", vif))
                else `uvm_error(get_full_name(), "unable to get the virtual interface handle")      
        endtask
endclass
