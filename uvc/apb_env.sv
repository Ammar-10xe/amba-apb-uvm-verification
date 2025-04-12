// Description: APB Environment Class
class apb_env extends uvm_env;
    `uvm_component_utils(apb_env)

    // Declare the agent instances
    apb_agent master_agent;
    apb_agent slave_agent;
    
    // Constructor
    function new(string name = "apb_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Create the master and slave agents
        master_agent = apb_agent::type_id::create("master_agent", this);
        slave_agent  = apb_agent::type_id::create("slave_agent", this);
        uvm_config_db#(uvm_active_passive_enum)::set(this,"master_agent*","agent_type",UVM_ACTIVE);
        uvm_config_db#(uvm_active_passive_enum)::set(this,"slave_agent*","agent_type",UVM_PASSIVE);

    endfunction
endclass
