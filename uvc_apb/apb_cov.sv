class apb_cov extends uvm_subscriber #(apb_tx);
	apb_tx tx;
	virtual apb_intf vif;
	`uvm_component_utils(apb_cov)
	//`NEW_COMP

	covergroup cg;
	endgroup

	function new(string name, uvm_component parent);
		super.new(name,parent);
		cg=new();
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

	function void write(apb_tx t);
		$cast(tx,t);
		cg.sample();
	endfunction
endclass
