 // Testbench for APB interface
 module apb_top();
        
        reg clk,rst;
        //clock generation
        initial begin
                clk = 0;
                forever #5 clk = ~clk; // 10 time unit clock period
        end

        initial begin
                rst = 1; // reset is active high
                repeat(2) @(posedge clk) rst = 0; // release reset after 15 time units
        end

        initial begin
           run_test("");
           $dumpfile("apb_top.vcd");
           $dumpvars(0, apb_top);
        end
 endmodule 
 