module top;
	reg clk,rst;
	apb_intf pif(clk,rst);

	always #5 clk=~clk;

	initial begin
		clk=0;
		rst=0;
		repeat(2)@(posedge clk);
		rst=1;
	end
	initial begin
		uvm_config_db#(virtual apb_intf)::set(uvm_root::get(),"*","vif",pif);
	end
	initial begin
		run_test("");
	end

	initial begin
		$dumpfile("apb.vcd");
		$dumpvars;
	end

endmodule
