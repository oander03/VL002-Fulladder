module adds (input logic b,
				input logic a,
				input logic c,
				output logic sum,
				output logic cout,
				output logic [6:0] sumhex
						);

	
	

	
	sevenseg u1 (
		.data(sum),
		.segments(sumhex)
	);
	
	assign sum = a ^ b ^ c;
	assign cout = (a & b) | (b & c) | (a & c);
				
endmodule