class apb_mon extends uvm_monitor;
	apb_tx tx;
	virtual apb_intf vif;
	`uvm_component_utils(apb_mon)
	`NEW_COMP

	uvm_analysis_port #(apb_tx) ap_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif))begin
			`uvm_error("APB_MONITOR","APB Interface Handle not got in APB MONITOR Class")
		end
		ap_port = new("ap_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			//@(posedge vif.pclk);
			@(vif.mon_cb);
			if(vif.psel && vif.penable && vif.pready)begin
				tx = apb_tx :: type_id :: create("tx");
				tx.wr_rd = vif.pwrite;
				tx.addr	 = vif.paddr;
				if(vif.pwrite)tx.wdata = vif.pwdata;
				else tx.rdata = vif.prdata;
				ap_port.write(tx);
				tx.print();
			end
		end
	endtask
endclass
