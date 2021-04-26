
module testbench();
reg clock;
reg reset;

top dut( .clock (clock),
          .reset (reset) ) ;

initial begin
  clock = 0 ;
  forever
#1 clock =~ clock; 
end

initial begin
reset = 1;
#6 reset = 0;
#3000 $stop();
end

endmodule
