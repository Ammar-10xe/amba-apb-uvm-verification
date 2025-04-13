// Description: axi Environment Class
class axi_env extends uvm_env;
    `uvm_component_utils(axi_env)

    // Declare the agent instances
    axi_agent master_agent;
    axi_agent slave_agent;
    
    // Constructor
    function new(string name = "axi_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Create the master and slave agents
        master_agent = axi_agent::type_id::create("master_agent", this);
        slave_agent  = axi_agent::type_id::create("slave_agent", this);
        uvm_config_db#(uvm_active_passive_enum)::set(this,"master_agent*","agent_type",UVM_ACTIVE);
        uvm_config_db#(uvm_active_passive_enum)::set(this,"slave_agent*","agent_type",UVM_PASSIVE);

    endfunction
endclass
