module alu( output[31:0] out,
   			input[31:0] leftIn,         
  			input[31:0] rightIn,         
  			input[3:0] func,          
  			input clock);
  
  //internal wire signals
wire [31:0] arithOut;   
wire [31:0] logicOut;
    

    //instantiations
    //arithmetic alu unit
    

arithmetic arithmetic_inst( .arithOut(arithOut),
                .leftIn(leftIn),
                .rightIn(rightIn),
                .func(func[2:0]),
               .clock(clock)
        );

   //logic alu unit 

  logicalu LogicALU_inst( .logicOut(logicOut),
   .leftOp(leftIn),
 .rightOp(rightIn),
   .func(func[2:0])     );

 //output multiplexer
 //select is msb of func

   assign out = ( func[3] == 0 )? arithOut : logicOut;

endmodule

