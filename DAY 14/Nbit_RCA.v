module RCA #(parameter N = 6)(
    input[N-1:0] a,b,
    input cin,
    output[N-1:0] sum,
    output cout

);

wire [N:0] carry;
assign cin = carry[0];

genvar  i;
generate
    
    for(i =0;i<N ;i=i+1)begin
        full_adder FA(  
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .sum(sum[i]),
            .cout(carry[i+1])
            );
        
    end

endgenerate

assign cout = carry[N];
endmodule

module full_adder(input a,b,cin,output sum ,cout);
assign sum= a^b^cin;
assign cout = (a&b)| (b&cin) | (cin&a);
endmodule