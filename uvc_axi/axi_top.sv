 // Testbench for axi interface
 module axi_top();
        
        reg clk,rst;
        axi_interface pif(clk,rst);
        //clock generation
        initial begin
                clk = 0;
                forever #5 clk = ~clk; // 10 time unit clock period
        end

        initial begin
                rst = 1; // reset is active high
                repeat(2) @(posedge clk) rst = 0;
        end
        initial begin 
          uvm_config_db#(virtual axi_interface)::set(uvm_root::get(), "*", "vif", pif);      
        end
        initial begin
           run_test("");
           $dumpfile("axi_top.vcd");
           $dumpvars(0, axi_top);
        end
 endmodule 
 