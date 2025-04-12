// Discription : This file contains the definition of the APB agent class.     
class apb_agent extends uvm_agent;

        `uvm_component_utils(apb_agent)
        // Declare the components
         apb_driver drv;
         apb_monitor mon;
         apb_sequencer sqr;
         apb_coverage cov;
         apb_responder rsp;
	 uvm_active_passive_enum agent_type;

         // constructor
        function new(string name = "apb_agent", uvm_component parent = null);
                super.new(name, parent);
        endfunction

        // build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                uvm_config_db#(uvm_active_passive_enum)::get(this,"","agent_type",agent_type);
                mon = apb_monitor :: type_id :: create("mon",this);
		if(agent_type==UVM_ACTIVE)begin
                        sqr = apb_sequencer::type_id::create("sqr", this);
                        drv = apb_driver::type_id::create("drv", this);
                        cov = apb_coverage::type_id::create("cov", this);
		end
		else if(agent_type==UVM_PASSIVE) begin
                        rsp = apb_responder::type_id::create("rsp", this);
		end
        endfunction

endclass