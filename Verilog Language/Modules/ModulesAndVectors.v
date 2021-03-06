module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);
    wire [7:0] q1, q2, q3;
    my_dff8 inst_dff1(
        .clk(clk),
        .d(d)
        .q(q)
        );
    my_dff8 inst_dff2(
        .clk(clk),
        .d(q1)
        .q(q2)
        );
    my_dff8 inst_dff2(
        .clk(clk),
        .d(q2)
        .q(q3)
        );
    always@*begin
        case(sel)
            2'b00:begin
                q <= d;
            end
            2'b01:begin
                q <= q1;
            end
            2'b10:begin
                q <= q2;
            end
            2'b11:begin
                q <= q3;
            end
        endcase
    end


endmodule
