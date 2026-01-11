module fulladder (input logic [9:0] SW,
						input logic MAX10_CLK1_50,
						input logic [1:0] KEY,
						output logic [9:0] LEDR,
						output logic [6:0] HEX0,
						output logic [6:0] HEX1,
						output logic [6:0] HEX2,
						output logic [6:0] HEX3,
						output logic [6:0] HEX4,
						output logic [6:0] HEX5
						);
						
	

	logic present_state, next_state;
	logic a, b, cin, cout;
	logic sum;
	
	logic [6:0] sumhex;	
	
	adds u1 (
	.a(a),
	.b(b),
	.c(cin),
	.sum(sum),
	.cout(cout),
	.sumhex(sumhex)
	);
	
	int i = 0;
	
	logic [6:0] HEX [5:0];
	
	assign {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0} = {HEX[5], HEX[4], HEX[3], HEX[2], HEX[1], HEX[0]};
	
	
	always_ff @(posedge MAX10_CLK1_50) begin

		if(~KEY[1]) begin
			HEX[i-1] <= sumhex;
			LEDR[i-1] <= sum;

				
			i <= i + 1;
			
			cin <= cout;

			if (i < 5) begin
				a <= SW[i];
				b <= SW[i+5];
			end
			else begin
				a <= 0;
				b <= 0;
			end
		end
		else if(~KEY[0]) begin
			cin <= 0;
			i <= 0;
			LEDR <= 0;
			HEX <= '{default: 7'b1111111};		
		end
		else begin
			cin <= 0;
			i <= 0;
		end
	end
						
	


	
						
endmodule