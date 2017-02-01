module LAC2(c, gout, pout, Cin, g, p);
      output [3:0] c;
      output gout, pout;
      input Cin;
      input [3:0] g, p;

      wire [1:0] cint, gint, pint;

      LAC leaf0 (
            .c(c[1:0]),
            .gout(gint[0]),
            .pout(pint[0]),
            .Cin(cint[0]),
            .g(g[1:0]),
            .p(p[1:0])
      );

      LAC leaf1 (
            .c(c[3:2]),
            .gout(gint[1]),
            .pout(pint[1]),
            .Cin(cint[1]),
            .g(g[3:2]),
            .p(p[3:2])
      );

      LAC root (
            .c(cint),
            .gout(gout),
            .pout(pout),
            .Cin(Cin),
            .g(gint),
            .p(pint)
      );
endmodule
