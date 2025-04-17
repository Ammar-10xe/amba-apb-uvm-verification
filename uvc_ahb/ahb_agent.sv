class ahb_agent extends uvm_agent;
        
        `uvm_component_utils(ahb_agent)

        ahb_sequencer ahb_seq;
        ahb_driver ahb_drv;
        ahb_monitor ahb_mon;
        ahb_coverage ahb_cov;
        ahb_responder ahb_resp;
        uvm_active_passive_enum agent_type;
        function new(string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase (uvm_phase phase);
                super.build_phase(phase);
                uvm_config_db#(uvm_active_passive_enum)::get(this,"","agent_type",agent_type);
                ahb_mon  = ahb_monitor::type_id::create("ahb_mon", this);
                if(agent_type == UVM_ACTIVE) begin 
                        ahb_seq  = ahb_sequencer::type_id::create("ahb_seq", this);
                        ahb_drv  = ahb_driver::type_id::create("ahb_drv", this);
                        ahb_cov  = ahb_coverage::type_id::create("ahb_cov", this);
                end
                else if (agent_type == UVM_PASSIVE) begin 
                        ahb_resp = ahb_responder::type_id::create("ahb_resp", this);
                end
        endfunction
endclass
