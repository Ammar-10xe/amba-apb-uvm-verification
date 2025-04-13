class apb_base_test extends uvm_test;
	apb_env env;
	`uvm_component_utils(apb_base_test)
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = apb_env :: type_id:: create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();
	endfunction

	function void report_phase(uvm_phase phase);
	if(apb_common::num_mismatches!=0 && apb_common::num_matches!=2*apb_common::count)begin
			`uvm_info("TEST FAILED",$sformatf("Matches=%0d\tMismatches=%0d",apb_common::num_matches,apb_common::num_mismatches),UVM_NONE)
		end
		else begin
			`uvm_info("TEST PASSED",$sformatf("Matches=%0d\tMismatches=%0d",apb_common::num_matches,apb_common::num_mismatches),UVM_NONE)
		end
	endfunction
endclass

class test_1wr_1rd extends base_test;
	`uvm_component_utils(test_1wr_1rd)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_1wr_1rd seq = seq_1wr_1rd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=0;
			seq.start(env.master_agent.sqr);	
			#100;
		phase.drop_objection(this);
	endtask
endclass

class test_5wr_5rd extends base_test;
	`uvm_component_utils(test_5wr_5rd)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_5wr_5rd seq = seq_5wr_5rd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=0;
			seq.start(env.master_agent.sqr);
			#100;
		phase.drop_objection(this);
	endtask
endclass

class test_nwr_nrd_no_wait_states extends base_test;
	`uvm_component_utils(test_nwr_nrd_no_wait_states)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_nwr_nrd seq = seq_nwr_nrd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=0;
			seq.start(env.master_agent.sqr);	
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass
class test_nwr_nrd_wait_states extends base_test;
	`uvm_component_utils(test_nwr_nrd_wait_states)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_nwr_nrd seq = seq_nwr_nrd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=1;
			seq.start(env.master_agent.sqr);	
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass

			seq.start(env.master_agent.sqr);
			#100;
		phase.drop_objection(this);
	endtask
endclass

class test_nwr_nrd_no_wait_states extends base_test;
	`uvm_component_utils(test_nwr_nrd_no_wait_states)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_nwr_nrd seq = seq_nwr_nrd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=0;
			seq.start(env.master_agent.sqr);	
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass
class test_nwr_nrd_wait_states extends base_test;
	`uvm_component_utils(test_nwr_nrd_wait_states)
	`NEW_COMP
	
	task run_phase(uvm_phase phase);
		seq_nwr_nrd seq = seq_nwr_nrd :: type_id :: create("seq");
		phase.raise_objection(this);
			apb_common::wait_state=1;
			seq.start(env.master_agent.sqr);	
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass

