`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave)

class axi_scoreboard extends uvm_scoreboard;
	
    `uvm_component_utils(axi_scoreboard)

    // Constructor
  function new (string name = "", uvm_component parent);
        super.new(name,parent);
    endfunction 

    uvm_analysis_imp_master #(axi_transaction,axi_scoreboard) master_imp;
    uvm_analysis_imp_slave  #(axi_transaction,axi_scoreboard) slave_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		master_imp =  new ("master_imp",this);
		slave_imp  =  new ("slave_imp",this);
	endfunction

	task run_phase(uvm_phase phase);
	
	endtask

	function void write_master(axi_transaction tx);
	
    endfunction

	function void write_slave(axi_transaction tx);
	
    endfunction

endclass
