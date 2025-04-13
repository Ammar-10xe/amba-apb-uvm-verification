class apb_env extends uvm_env;
	apb_agent magent;
	apb_agent sagent;
	apb_sbd sbd;
	`uvm_component_utils(apb_env)
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		magent = apb_agent :: type_id:: create("magent",this);
		sagent = apb_agent :: type_id:: create("sagent",this);
		sbd = apb_sbd :: type_id:: create("sbd",this);
		uvm_config_db#(uvm_active_passive_enum)::set(this,"magent*","agent_type",UVM_ACTIVE);
		uvm_config_db#(uvm_active_passive_enum)::set(this,"sagent*","agent_type",UVM_PASSIVE);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		magent.mon.ap_port.connect(sbd.master_imp);
		sagent.mon.ap_port.connect(sbd.slave_imp);
	endfunction
endclass

