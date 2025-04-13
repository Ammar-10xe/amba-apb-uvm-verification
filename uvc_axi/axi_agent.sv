// Discription : This file contains the definition of the axi agent class.     
class axi_agent extends uvm_agent;

        `uvm_component_utils(axi_agent)
        // Declare the components
         axi_driver drv;
         axi_monitor mon;
         axi_sequencer sqr;
         axi_coverage cov;
         axi_responder rsp;
	 uvm_active_passive_enum agent_type;

         // constructor
        function new(string name = "axi_agent", uvm_component parent = null);
                super.new(name, parent);
        endfunction

        // build phase
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                uvm_config_db#(uvm_active_passive_enum)::get(this,"","agent_type",agent_type);
                mon = axi_monitor :: type_id :: create("mon",this);
		if(agent_type==UVM_ACTIVE)begin
                        sqr = axi_sequencer::type_id::create("sqr", this);
                        drv = axi_driver::type_id::create("drv", this);
                        cov = axi_coverage::type_id::create("cov", this);
		end
		else if(agent_type==UVM_PASSIVE) begin
                        rsp = axi_responder::type_id::create("rsp", this);
		end
        endfunction

endclass