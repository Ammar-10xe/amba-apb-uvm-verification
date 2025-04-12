// Discription : This file contains the definition of the APB agent class.     
class apb_agent extends uvm_agent;

        `uvm_component_utils(apb_agent)
        // Declare the components
         apb_driver drv;
         apb_monitor mon;
         apb_sequencer sqr;
         apb_coverage cov;
         pb_rsponder rsp;
         
         // constructor
        function new(string name = "apb_agent", uvm_component parent = null);
                super.new(name, parent);
        endfunction

        // build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                sqr = apb_sequencer::type_id::create("sqr", this);
                drv = apb_driver::type_id::create("drv", this);
                mon = apb_monitor::type_id::create("mon", this);
                cov = apb_coverage::type_id::create("cov", this);
                rsp = pb_rsponder::type_id::create("rsp", this);
        endfunction

endclass