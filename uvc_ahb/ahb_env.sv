class ahb_env extends uvm_env;

        `uvm_component_utils(ahb_env)

        ahb_agent master_agent,slave_agent;
        
        function new (string name = "", uvm_component parent);
                super.new(name,parent);
        endfunction 

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                master_agent = ahb_agent::type_id::create("master_agent",this);
                slave_agent = ahb_agent::type_id::create("slave_agent",this);
                uvm_config_db#(uvm_active_passive_enum)::set(this,"master_agent*","agent_type",UVM_ACTIVE);
                uvm_config_db#(uvm_active_passive_enum)::set(this,"slave_agent*","agent_type",UVM_PASSIVE);

        endfunction 
        
endclass 
