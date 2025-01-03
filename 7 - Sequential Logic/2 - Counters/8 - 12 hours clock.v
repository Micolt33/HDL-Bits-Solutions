module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always@(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
            pm <= 1'b0;
        end
    
        else if (reset == 0 && ena == 1) begin
            if (ss[3:0] == 4'h9) begin
                ss[3:0] <= 4'h0;
                ss[7:4] <= ss[7:4] + 4'h1;
            end
                else ss <= ss + 8'h01;
            if (ss[3:0] == 4'h9 && ss[7:4] == 4'h5) begin
                ss <= 8'h00;
                if (mm[3:0] == 4'h9) begin
                mm[3:0] <= 4'h0;
                mm[7:4] <= mm[7:4] + 4'h1;
           		end
                else mm <= mm + 8'h01;
            end
           
            if (mm[3:0] == 4'h9 && mm[7:4]== 4'h5) begin
                mm <= 8'h00;
                if (hh[3:0] == 4'h9 ) begin
                    hh[3:0] <= 4'h0;
                    hh[7:4] <= 4'h1;
            	end
                else if (hh == 8'h12 && mm == 8'h59) begin
                    hh[3:0] <= 4'h1;
                    hh[7:4] <= 4'h0;
                    pm <= !pm;
            	end
                else hh <= hh + 8'h01; 
                    //if (hh == 8'h12)
                    //pm <= !pm;
                    //hh <= hh + 8'h01;
            end
        end
    end
    
endmodule
