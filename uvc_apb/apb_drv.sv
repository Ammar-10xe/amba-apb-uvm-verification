class apb_drv extends uvm_driver #(apb_tx);
	apb_tx tx;
	virtual apb_intf vif;
	`uvm_component_utils(apb_drv)
	`NEW_COMP

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif))begin
			`uvm_error("APB_DRIVER","APB Interface Handle not got in APB Driver Class")
		end
	endfunction

	task run_phase(uvm_phase phase);
		wait(vif.prst==1);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

	//task drive_tx(apb_tx tx);
	//	`uvm_info("DRIVING","### Transaction is getting Driven ###",UVM_NONE)
	//	@(posedge vif.pclk);
	//	vif.pwrite 		= tx.wr_rd;
	//	vif.paddr 		= tx.addr;
	//	if(tx.wr_rd) vif.pwdata = tx.wdata;
	//	else vif.pwdata = 0;
	//	vif.psel		=1;
	//	@(posedge vif.pclk);
	//	vif.penable		=1;
	//	wait(vif.pready);
	//	@(posedge vif.pclk);
	//	if(!tx.wr_rd) begin
	//		tx.rdata = vif.prdata;
	//		tx.wdata = 0;
	//	end
	//	vif.penable		= 0;
	//	vif.pwrite 		= 0;
	//	vif.paddr 		= 0;
	//	vif.pwdata 		= 0;
	//	vif.psel		= 0;
	//endtask

	task drive_tx(apb_tx tx);
		`uvm_info("DRIVING","### Transaction is getting Driven ###",UVM_NONE)
		@(vif.drv_cb);
		vif.drv_cb.pwrite 		<= tx.wr_rd;
		vif.drv_cb.paddr 		<= tx.addr;
		if(tx.wr_rd) vif.drv_cb.pwdata <= tx.wdata;
		else vif.drv_cb.pwdata <= 0;
		vif.drv_cb.psel		<=1;
		@(vif.drv_cb);
		vif.drv_cb.penable		<=1;
		wait(vif.drv_cb.pready);
		//@(vif.drv_cb);
		if(!tx.wr_rd) begin
			tx.rdata = vif.drv_cb.prdata;
			tx.wdata = 0;
		end
		vif.drv_cb.penable		<= 0;
		vif.drv_cb.pwrite 		<= 0;
		vif.drv_cb.paddr 		<= 0;
		vif.drv_cb.pwdata 		<= 0;
		vif.drv_cb.psel			<= 0;
	endtask
endclass
