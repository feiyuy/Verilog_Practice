module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [100:0]cin_i;
    assign cin_i[0] = cin;

    genvar i;
    generate
        for(i = 0; i < 100; i++)begin:add
            bcd_fadd add1(
                .a(a[(4*i+3)-:4]),
                .b(b[(4*i+3)-:4]),
                .cin(cin_i[i]), 
                .cout(cin_i[i+1]),
                .sum(sum[(4*i+3)-:4])
            );
        end
    endgenerate

    assign cout = cin_i[100];

endmodule
