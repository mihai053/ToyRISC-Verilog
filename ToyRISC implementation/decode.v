
module decode( output we ,
output writeEnable ,
input [5:0] opCode );



assign we = opCode == 6'b101000 ;

assign writeEnable = &opCode[5:4]  |  &opCode[2:0] ;


endmodule
