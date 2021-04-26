module top(input clock, input reset);
	wire [31:0] dataIn, dataOut, dataAddr, instruction;
	wire [15:0] instrAddr;
	wire we;

	datamemory DM(.clock(clock), .reset(reset), .dataIn(dataOut), .dataOut(dataIn), 
		      .dataAddr(dataAddr), .we(we));

	programmemory PM(.clock(clock), .reset(reset), .instruction(instruction),
			 .instrAddr(instrAddr));

	toyRISC tR(.clock(clock), .reset(reset), .dataAddr(dataAddr), .dataOut(dataOut),
		   .dataIn(dataIn),.we(we), .instruction(instruction), .instrAddr(instrAddr)); 
endmodule