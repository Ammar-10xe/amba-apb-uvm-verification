module ahb_top;

        reg clk,rst;

        // clock generation
        initial begin
                 clk = 0;
                 forever #5 clk = ~clk; // 10 time unit clock period
        end

        initial begin 
                rst = 1;
                repeat (2) @(posedge clk) rst = 0;
                rst = 0; 
        end

        initial begin 
                run_test("");
                $dumpfile("dump.vcd");
                $dumpvars;
        end
endmodule
 