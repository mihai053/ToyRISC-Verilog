
module RALU(

input [31:0] instruction,				
output [31:0] dataAddr,
				
output [31:0] dataOut,
input [31:0] dataIn,		
output [31:0] leftOp,
	
input [15:0] incPc,

			
input writeEnable,
				
input clock);



wire [31:0] aluOut ;

wire [31:0] rightOp ;

wire [31:0] regFileIn ;


assign dataAddr = rightOp ;

assign dataOut = leftOp ;

filereg fileReg(.leftOut (leftOp),
.rightOut (rightOp),
.in (regFileIn),
.leftAddr (instruction[20:16]),
.rightAddr (instruction[15:11]),
.destAddr (instruction[25:21]),
.writeEnable (writeEnable),
.clock (clock),
.reset(reset));



mux4_32 mux(.out(regFileIn),
.in0({16'b0, incPc}),
.in1({{16{instruction[15]}}, instruction[15:0]}),
.in2(dataIn),
.in3(aluOut),
.sel(instruction[31:30]));
				



alu alu(.out (aluOut),
.leftIn(leftOp),
.rightIn(rightOp),
.func(instruction[29:26]),.clock(clock));		


endmodule