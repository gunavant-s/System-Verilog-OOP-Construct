// Bitwise operators — perform operations on each bit of a vector 
// ~ & | ^ ^~ ~^

module tb;
  bit [2:0] a=3'd2, b=3'd4, y;
  
  initial begin
    $display("a : %0b | b : %0b",a,b);
    #10;
    y = ~a;
    #10;
    y = a & b;
    #10;
    y = a | b;
    #10;
    y = a ^ b;
    #10;
    y = a ~^ b;
    #10;
    $finish();
  end
  
  initial begin
    $monitor("y = %0b | time = %0t",y,$time());
  end
  
endmodule

/*
# KERNEL: a : 10 | b : 100
# KERNEL: y = 101 | time = 10
# KERNEL: y = 0 | time = 20
# KERNEL: y = 110 | time = 30
# KERNEL: y = 110 | time = 40
# KERNEL: y = 1 | time = 50
*/
