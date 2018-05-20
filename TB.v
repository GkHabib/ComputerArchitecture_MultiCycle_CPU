module TB ();
  reg start=0, clk=0, rst=0;
  wire done;
  module CPU (.clk(clk), .rst(rst), .start(start), .done(done));
  initial begin
    #20
    rst=1;
    #20
    rst=0
    #20
  end
  initial begin
    repeat (50) #20 clk=~clk;
  end
endmodule // TB
