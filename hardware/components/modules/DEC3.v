module DEC3 (
    input [2:0] data,
    output eq0, output eq1, output eq2, output eq3,
    output eq4, output eq5, output eq6, output eq7
);
    assign eq0 = (data == 3'd0);
    assign eq1 = (data == 3'd1);
    assign eq2 = (data == 3'd2);
    assign eq3 = (data == 3'd3);
    assign eq4 = (data == 3'd4);
    assign eq5 = (data == 3'd5);
    assign eq6 = (data == 3'd6);
    assign eq7 = (data == 3'd7);
endmodule
