module LAC3(c, gout, pout, Cin, g, p);
      output [7:0] c;
      output gout, pout;
      input Cin;
      input [7:0] g, p;

      wire [1:0] cint, gint, pint;

      LAC2 leaf0 (
            .c(c[3:0]),
            .gout(gint[0]),
            .pout(pint[0]),
            .Cin(cint[0]),
            .g(g[3:0]),
            .p(p[3:0])
      );

      LAC2 leaf1 (
            .c(c[7:4]),
            .gout(gint[1]),
            .pout(pint[1]),
            .Cin(cint[1]),
            .g(g[7:4]),
            .p(p[7:4])
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
