module alu_cell(d, g, p, a, b, c, S);
      output d, g, p;
      input a, b, c;
      input [2:0] S;

      wire cint, bint, tempor, tempand, tempnor, tempadd;

      assign bint = S[0] ^ b;
      assign g = a & bint;
      assign p = a ^ bint;
      assign cint = S[1] & c;
      // assign tempadd = p ^ cint;

      // assign tempor = a | b;
      // assign tempand = a & b;
      // assign tempnor = ~tempor;


      assign d =

                  (S[2]?
                        // If S[2] is 1
                        (S[1]?
                              // If S[1] is 1
                              (S[0]?
                                    0:(a & b)
                              ):
                              // If S[1] is 0
                              (S[0]?
                                    ~(a | b): (a | b)
                              )
                        ):
                        // If S[2] is 0
                        p ^ cint
                  );


endmodule
