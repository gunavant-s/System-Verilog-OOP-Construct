interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic clk;
  logic [4:0] sum;
  
endinterface

class driver;
  
  virtual add_if inf;
  
  task run();
    forever begin
      @(posedge inf.clk);  
      inf.a <= $random();
      inf.b <= $random();
      $display("a : %0d, b : %0d, Sum : %0d | Time : %0d",inf.a,inf.b,inf.sum,$time()); 
      $display("[DRV] : Interface Trigger");
    end
  endtask
    
endclass

module tb;
  add_if inf(); //Unlike handler in class, interface requires ()
  driver drv;
  
  add dut (inf.a,inf.b,inf.clk,inf.sum);
  
  always #5 inf.clk = ~inf.clk;
  
  initial begin 
    inf.clk <= 0;
  end
  
  initial begin
    drv = new();
    drv.inf = inf;
    drv.run();
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;  
    #100;
    $finish();
  end
endmodule
