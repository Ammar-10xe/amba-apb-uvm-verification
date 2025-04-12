`uvm_analysis_imp_decl(_master)
`uvm_analysis_imp_decl(_slave)
class apb_sbd extends uvm_scoreboard;
	apb_tx mtx,stx,mtx_t,stx_t,mtxQ[$],stxQ[$];
	`uvm_component_utils(apb_sbd)
	`NEW_COMP

	uvm_analysis_imp_master #(apb_tx,apb_sbd) master_imp;
	uvm_analysis_imp_slave #(apb_tx,apb_sbd) slave_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		master_imp = new("master_imp",this);
		slave_imp = new("slave_imp",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			wait(mtxQ.size()>0 && stxQ.size()>0);
			mtx = mtxQ.pop_front();
			stx = stxQ.pop_front();
			if(mtx.compare(stx)) apb_common::num_matches++;
			else apb_common :: num_mismatches++;
		end
	endtask

	function void write_master(apb_tx t);
		$cast(mtx_t,t);
		mtxQ.push_back(mtx_t);
	endfunction
	function void write_slave(apb_tx t);
		$cast(stx_t,t);
		stxQ.push_back(stx_t);
	endfunction
endclass

