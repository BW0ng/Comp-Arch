module testbench();

      reg [31:0] d;
      reg Cout;
      reg V;
      reg [31:0] a;
      reg [31:0] b;
      reg Cin;
      reg [2:0] S;
      reg clk;

      alu32 dut (d, Cout, V, a, b, Cin, S);

      always @ ( * ) begin
            clk = 1; #10; clk = 0; #10;
      end
/*
      ######################################
      #             Commands               #
      ######################################
      ######################################
      #     S    |      ALU Function       #
      ######################################
      #    000   |      A XOR B            #
      #    001   |      A XNOR B           #
      #    010   |      A + B              #
      #    011   |      A - B              #
      #    100   |      A OR B             #
      #    101   |      A NOR B            #
      #    110   |      A AND B            #
      #    111   |      X                  #
      ######################################
*/

      initial begin
            #0 a = 32'h00000001;
            #0 b = 32'h00000001;
            #0 S = 3'b010;          // For Addition
      end


endmodule
