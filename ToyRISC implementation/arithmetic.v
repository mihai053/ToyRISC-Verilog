module arithmetic (output [31:0] arithOut,
                                       input [31:0] leftIn,
                                        input[31:0] rightIn,
                                      input[2:0] func,
input clock);


reg carry;
wire  nextCarry;
wire [31:0] rightOp;
wire cr;

always @(posedge clock) carry<=nextCarry;

assign rightOp={32{func[0]}}^(func[1]?rightIn: {{31{1'b0}}, ~func[2]});
assign cr= func[0] ^ (func[2] ?carry: 1'b0);
assign {nextCarry,arithOut} =leftIn+rightOp +cr;

endmodule
   




