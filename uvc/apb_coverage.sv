// Description: APB coverage collector class
class apb_coverage extends uvm_subscriber#(apb_transaction);
    `uvm_component_utils(apb_coverage)

    // Constructor
    function new(string name = "apb_coverage", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        // Coverage collection logic goes here
    endtask

    // write method to collect coverage data
    function void write(apb_transaction tx);
        // Collect coverage data based on the transaction
    endfunction

endclass
