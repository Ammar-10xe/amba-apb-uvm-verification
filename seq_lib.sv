class apb_base_seq extends uvm_sequence#(apb_tx);
	apb_tx tx,txQ[$];
	`uvm_object_utils(apb_base_seq)
	`NEW_OBJ

	task pre_body();
	endtask
	task post_body();
	endtask
endclass

class seq_wr_rd extends apb_base_seq;
	`uvm_object_utils(seq_wr_rd)
	`NEW_OBJ

	task body();
		repeat(apb_common::count)begin
			`uvm_do_with(req,{req.wr_rd==1;})
			tx= new req;
			txQ.push_back(tx);
		end
		repeat(apb_common::count)begin
			tx=txQ.pop_front();
			`uvm_do_with(req,{req.wr_rd==0;req.addr == tx.addr;})
		end
	endtask
endclass
