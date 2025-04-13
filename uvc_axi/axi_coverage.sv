// Description: axi coverage collector class
class axi_coverage extends uvm_subscriber#(axi_transaction);
    `uvm_component_utils(axi_coverage)

    // Constructor
    function new(string name = "axi_coverage", uvm_component parent = null);
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
    function void write(axi_transaction t);
        // Collect coverage data based on the transaction
    endfunction

endclass
