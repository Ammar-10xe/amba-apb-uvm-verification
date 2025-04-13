// Discription: axi Responder
class axi_responder extends uvm_driver;
        `uvm_component_utils(axi_responder)
         virtual axi_interface vif;       
        // Constructor
        function new(string name = "axi_responder", uvm_component parent = null);
                super.new(name, parent);
        endfunction
        
        // Build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
          if(!uvm_config_db#(virtual axi_interface)::get(this,"","vif",vif)) begin 
                        `uvm_error(get_full_name(), "unable to get the virtual interface handle")
                        
                end
        endfunction
        
        // Run phase
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
//                     vif=axi_top.pif;

        endtask

endclass
