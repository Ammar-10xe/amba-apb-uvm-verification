
// Discription: axi Interface
interface axi_interface(input clk,prst);


    // write_address channel
    logic [3:0]  awid;
    logic [31:0] awaddr;
    logic [3:0]  awlen;
    logic [2:0]  awsize;
    logic [1:0]  awburst;
    logic [1:0]  awlock;
    logic [3:0]  awcache;
    logic [2:0]  awprot;
    logic        awvalid;
    logic        awready;
    
    // write_data channel
    logic [3:0]  wid;
    logic [31:0] wdata;
    logic [3:0]  wstrb;
    logic        wlast;
    logic        wvalid;
    logic        wready;
    
    // write_response channel
    logic [3:0]  bid;
    logic [1:0]  bresp;
    logic        bvalid;
    logic        bready;

    // read_address channel
    logic [3:0]  arid;
    logic [31:0] araddr;
    logic [3:0]  arlen;
    logic [2:0]  arsize;
    logic [1:0]  arburst;
    logic [1:0]  arlock;
    logic [3:0]  arcache;
    logic [2:0]  arprot;
    logic        arvalid;
    logic        arready;

    // read_data and response channel
    logic [3:0]  rid;
    logic [31:0] rdata;
    logic [1:0]  rresp;
    logic        rlast;
    logic        rvalid;
    logic        rready;

    clocking drv_cb @(posedge clk);
        
        default input #0 output #1;

        // Write Address Channel
        output   awid;
        output   awaddr;
        output   awlen;
        output   awsize;
        output   awburst;
        output   awlock;
        output   awcache;
        output   awprot;
        output   awvalid;
        input    awready;
        
        // Write Data Channel
        output   wid;
        output   wdata;
        output   wstrb;
        output   wlast;
        output   wvalid;
        input    wready;
    
        // Write Response Channel
        input    bid;
        input    bresp;
        input    bvalid;
        output   bready;
      
        // Read Address Channel
        output   arid;
        output   araddr;
        output   arlen;
        output   arsize;
        output   arburst;
        output   arlock;
        output   arcache;
        output   arprot;
        output   arvalid;
        input    arready;
      
        // Read Data and Response Channel
        input    rid;
        input    rdata;
        input    rresp;
        input    rlast;
        input    rvalid;
        output   rready;
      
      endclocking
      
endinterface
