`define nop  	6'b000000 	// no operation: pc = pc+1;
`define rjmp 	6'b000001 	// relative jump: pc = pc + value;
`define zjmp  	6'b000010 	// cond jump: pc = (rf[left] = 0) ? pc + value : pc+1
`define nzjmp   6'b000011 	// !cond jump: pc = !(rf[left] = 0) ? pc + value : pc+1
`define ret  	6'b000101 	// return from subroutine: pc = rf[left][15:0];
`define ajmp 	6'b000110	// absolute jump: pc = value;
`define call  	6'b000111	//subroutine call: pc = value; rf[dest] = pc+1;
module nextpc ( output reg[15:0] addr,
		output reg[15:0] incPc,
		input [15:0] jmpVal,
		input [5:0] opCode,
		input [31:0] leftOp,
		input [15:0] pc);
always @ (*) 
begin
       case(opCode)
     `nop: 		addr <= pc + 1;
	 `rjmp: 	addr <= pc + jmpVal;
	 `zjmp:         begin
                            if(leftOp == 32'b0)
                                addr <= pc + jmpVal;
                            else
                                addr <= pc + 1;
                        end
	 `nzjmp:        begin
                            if(!(leftOp == 32'b0))
                                addr <= pc + jmpVal;
                            else
                                addr <= pc + 1;
                        end
	 `ret:            addr <= leftOp[15:0];
	 `ajmp: 	  addr <= jmpVal;
	 `call:         begin
                          addr <= jmpVal;
                          incPc <= pc + 1;
                        end    
      default: addr <= pc + 1;
       endcase
end
endmodule

