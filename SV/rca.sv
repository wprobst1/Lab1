module rca (input logic [3:0] a, [3:0] b, output logic [4:0] s);
logic [2:0] cout;
silly fa1(a[0], b[0], 1'b0, s[0], cout[0]);
silly fa2(a[1], b[1], cout[0], s[1], cout[1]);
silly fa3(a[2], b[2], cout[1], s[2], cout[2]);
silly fa4(a[3], b[3], cout[2], s[3], s[4]);

endmodule