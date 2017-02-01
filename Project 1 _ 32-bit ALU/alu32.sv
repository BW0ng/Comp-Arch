module alu32 (d, Cout, V, a, b, Cin, S);
      output [31:0] d;
      output Cout, V;
      input [31:0] a, b;
      input Cin;
      input [2:0] S;

      wire [31:0] c, g, p;
      wire gout, pout;

      alu_cell cells [31:0] (
            .d(d),
            .g(g),
            .p(p),
            .a(a),
            .b(b),
            .c(c),
            .S(S)
      );

      LAC5 lac (
            .c(c),
            .gout(gout),
            .pout(pout),
            .Cin(Cin),
            .g(g),
            .p(p)
      );

      assign Cout = gout | (pout & Cin);
      assign V = Cout ^ c[31];
endmodule
