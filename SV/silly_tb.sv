
module tb;

   logic [3:0] a;
   logic [3:0] b;
   logic [4:0] s;
   logic [2:0] cout;
   logic [4:0] s_correct;
   logic clk;   
   logic [31:0] errors;
   logic [31:0] vectornum;

   integer handle3;
   integer desc3;
   integer i;
   integer j;
   integer k;

  // instantiate device under test
   rca dut (a, b, s);

   assign s_correct = a + b;
 ////////////////////////////////////////////////////////////////////

   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end


   initial
     begin
		handle3 = $fopen("rca.out");
		vectornum = 0;
		errors = 0;
		desc3 = handle3;
     end

	initial begin
		for (i = 0; i < 150; i = i++)
			begin
				@(posedge clk)
					begin
						a = $random;
						b = $random;
					end
				@(negedge clk)
					begin
						vectornum++;
						if (s != s_correct)
						begin
							errors = errors++;
							$display("Error: %h %h || %h || %h != %h", a, b, s, s, s_correct);
						end
					end
				$fdisplay(desc3, "%h %h || %h || %h || %b", a, b, s, s_correct, (s == s_correct));
			end
		$display("%d tests completed with %d errors", vectornum, errors);
		$finish;
	end  
endmodule
