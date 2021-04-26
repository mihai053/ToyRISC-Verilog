module filereg(	output reg [31:0] leftOut,
						output reg [31:0] rightOut,
						input [31:0] in,
						input [4:0] leftAddr,
						input [4:0] rightAddr,
						input [4:0] destAddr,
						input writeEnable,
						input reset,
						input clock	);
						
	integer i;					
	reg [31:0] file[0:31];

  always @(posedge clock)
    if(reset) begin
      for(i=0;i<32;i=i+1) file[i] <= 32'b0;
      leftOut <= 32'b0;
      rightOut <= 32'b0;
    end
    
    else begin
      leftOut <= file[leftAddr];
      rightOut <= file[rightAddr];
      if(writeEnable) file[destAddr] <= in;
    end

endmodule