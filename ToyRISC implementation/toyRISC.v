module toyRISC( output[15:0] instrAddr,
                                   input [31:0] instruction,
                                   output[31:0] dataAddr,
                                   output[31:0] dataOut,
                                   input [31:0] dataIn,
                                 output we, input reset, input clock);

wire  writeEnable ;
wire [15:0] incPc;
wire [31:0] leftOp;



decode Decode(.we (we),.writeEnable(writeEnable),.opCode(instruction[31:26]));

control Control( instrAddr, instruction, incPc,leftOp, reset,clock);

RALU RALU ( instruction, dataAddr,dataOut,dataIn, leftOp ,incPc,writeEnable, clock);

endmodule
