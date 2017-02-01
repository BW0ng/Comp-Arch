module LAC4(c, gout, pout, Cin, g, p);
      output [15:0] c;
      output gout, pout;
      input Cin;
      input [15:0] g, p;

      wire [1:0] cint, gint, pint;

      LAC3 leaf0 (
            .c(c[7:0]),
            .gout(gint[0]),
            .pout(pint[0]),
            .Cin(cint[0]),
            .g(g[7:0]),
            .p(p[7:0])
      );

      LAC3 leaf1 (
            .c(c[15:8]),
            .gout(gint[1]),
            .pout(pint[1]),
            .Cin(cint[1]),
            .g(g[15:8]),
            .p(p[15:8])
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
