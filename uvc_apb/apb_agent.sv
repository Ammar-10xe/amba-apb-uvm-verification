class apb_agent extends uvm_agent;
	apb_sqr sqr;
	apb_drv drv;
	apb_mon mon;
	apb_cov cov;
	apb_rsp rsp;
	uvm_active_passive_enum agent_type;
	`uvm_component_utils_begin(apb_agent)
		`uvm_field_enum(uvm_active_passive_enum,agent_type,UVM_ALL_ON)
	`uvm_component_utils_end
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(uvm_active_passive_enum)::get(this,"","agent_type",agent_type);
		$display("Agent type=%0s",agent_type);
		mon = apb_mon :: type_id :: create("mon",this);
		if(agent_type==UVM_ACTIVE)begin
			sqr = apb_sqr :: type_id :: create("sqr",this);
			drv = apb_drv :: type_id :: create("drv",this);
			cov = apb_cov :: type_id :: create("cov",this);
		end
		else if(agent_type==UVM_PASSIVE) begin
			rsp = apb_rsp :: type_id :: create("rsp",this);
		end
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if(agent_type==UVM_ACTIVE)begin
			drv.seq_item_port.connect(sqr.seq_item_export);
			mon.ap_port.connect(cov.analysis_export);
		end
	endfunction
endclass

