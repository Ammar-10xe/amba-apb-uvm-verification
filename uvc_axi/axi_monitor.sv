// Description: axi Monitor
class axi_monitor extends uvm_monitor;
    `uvm_component_utils(axi_monitor)
    virtual axi_interface vif;
    axi_transaction tx;
    uvm_analysis_port #(axi_transaction) ap_port;

    // Constructor
    function new(string name = "axi_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(virtual axi_interface)::get(this, "", "vif", vif))
        else `uvm_error(get_full_name(), "unable to get the virtual interface handle")
        ap_port = new("ap_port",this);
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        ap_port.write(tx);
    endtask

endclass