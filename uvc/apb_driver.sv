// Description: APB driver class
class apb_driver extends uvm_driver;
        
        `uvm_component_utils(apb_driver)

        // constructor
        function new(string name = "apb_driver", uvm_component parent = null);
                super.new(name, parent);
        endfunction

        //build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                set_sequencer(sqr);
        endfunction

        //run phase
        task run_phase(uvm_phase phase);
                super.run_phase(phase);
        endtask
endclass
