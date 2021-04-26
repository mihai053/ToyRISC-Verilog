

module logicalu(
	output reg [31:0] logicOut,
	
    input [31:0] leftOp,

	input [31:0] rightOp,

	input [2:0] func
			
);
	
	always@ ( * ) begin
	
		case(func) 
			 3'b000:    logicOut = leftOp >> 1;        //lsh
			 3'b001:	logicOut = {leftOp[31],leftOp[31:1]};		//ash
			 3'b010:	logicOut = leftOp;		//move
			 3'b011:	logicOut = {leftOp[15:0],leftOp[31:16]}; //swap
			 3'b100:	logicOut = ~leftOp;			 //neg
			 3'b101:	logicOut = leftOp & rightOp; //bwand
			 3'b110:	logicOut = leftOp | rightOp; //bwor
			 3'b111:	logicOut = leftOp ^ rightOp; //bwxor
			default : logicOut = leftOp >> 1;
		endcase
	
	
	end

	
endmodule