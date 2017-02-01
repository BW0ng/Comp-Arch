module LAC5(c, gout, pout, Cin, g, p);
      output [31:0] c;
      output gout, pout;
      input Cin;
      input [31:0] g, p;

      wire [1:0] cint, gint, pint;

      LAC4 leaf0 (
            .c(c[15:0]),
            .gout(gint[0]),
            .pout(pint[0]),
            .Cin(cint[0]),
            .g(g[15:0]),
            .p(p[15:0])
      );

      LAC4 leaf1 (
            .c(c[31:16]),
            .gout(gint[1]),
            .pout(pint[1]),
            .Cin(cint[1]),
            .g(g[31:16]),
            .p(p[31:16])
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
