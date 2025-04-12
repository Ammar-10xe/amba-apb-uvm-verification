class apb_rsp extends uvm_driver#(apb_tx);
	apb_tx tx;
	virtual apb_intf vif;
	bit[WIDTH-1:0] mem[int];
	`uvm_component_utils(apb_rsp)
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif))begin
			`uvm_error("APB_RESPONDER","APB Interface Handle not got in APB RESPONDER Class")
		end
	endfunction

	task run_phase(uvm_phase phase);
		wait(vif.prst==1);
		forever begin
			@(posedge vif.pclk);
			if(vif.psel && vif.penable)begin
				if(apb_common::wait_states==1) begin
					repeat($urandom_range(1,5)) @(posedge vif.pclk);
					vif.pready=1;
				end
				else 
					vif.pready=1;
				if(vif.pwrite) mem[vif.paddr] = vif.pwdata;
				else vif.prdata = mem[vif.paddr];
			end
			else begin
				vif.pready=0;
				vif.prdata=0;
			end
		end
	endtask
endclass
