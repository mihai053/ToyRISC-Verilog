
module control(output [15:0] instrAddr ,

					
input [31:0] instruction ,
					
output [15:0] incPc ,
					
input [31:0] leftOp ,
					
input reset ,
					
input clock );

reg [15:0] pc ;


always @(posedge clock)
 if (reset) pc <=0 ;

else pc <= instrAddr ;


nextpc nextPc( .addr (instrAddr ),
.incPc (incPc ),
.pc (pc ),
.jmpVal (instruction[15:0] ),
.leftOp (leftOp ),
.opCode (instruction[31:26] ));



endmodule
