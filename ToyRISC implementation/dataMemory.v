module datamemory(input [31:0] dataIn,
		  input clock, reset, we,
		  input [31:0] dataAddr,
		  output reg [31:0] dataOut);

reg [31:0] DataMem [0:256];
integer i;
always @(posedge clock) begin
	if(reset) begin
	for (i=0; i<256; i=i+1)
	    DataMem[i]<={32'b0};
	    dataOut<={32'b0};
	end
	else
	if(we)
	   DataMem[dataAddr]<=dataIn;
	else
	   dataOut<=DataMem[dataAddr];
end
endmodule


