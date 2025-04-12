// Description: APB Monitor
class apb_monitor extends uvm_monitor;
    `uvm_component_utils(apb_monitor)

    // Constructor
    function new(string name = "apb_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask

endclass