interface apb_intf(input pclk,prst);
	bit penable;
	bit pready;
	bit pwrite;
	bit psel;
	bit [ADDR_WIDTH-1:0] paddr;
	bit [WIDTH-1:0] pwdata;
	bit [WIDTH-1:0] prdata;

	clocking drv_cb@(posedge pclk);
		default input #0 output #1;
		output penable;
		input pready;
		output pwrite;
		output psel;
		output paddr;
		output pwdata;
		input prdata;
	endclocking
	clocking mon_cb@(posedge pclk);
		default input #1;
		input penable;
		input pready;
		input pwrite;
		input psel;
		input paddr;
		input pwdata;
		input prdata;
	endclocking

	clocking rsp_cb@(posedge pclk);
		default input #1 output #0;
		input penable;
		output pready;
		input pwrite;
		input psel;
		input paddr;
		input pwdata;
		output prdata;
	endclocking
endinterface
