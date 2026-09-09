`timescale 1ns / 1ps

module tb_REG8_DIAGNOSTIC;
    reg CL, clk, LD, INC, DEC, C0, E0;
    reg [7:0] I;
    wire E8, C8;
    wire [7:0] A;

    // Instanciranje tvog registra
    REG8_LD_CL_INC_DEC uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .I(I), .E8(E8), .C8(C8), .A(A)
    );

    // Takt generator
    always #5 clk = ~clk;

    initial begin
        // Inicijalizacija
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n================== DIAGNOSTICKI TEST REG8 ==================");
        
        // KORAK 1: Upis vrednosti FF u registar
        $display("\n[KORAK 1] Upisujemo 8'hFF u registar...");
        LD = 1; I = 8'hFF;
        @(posedge clk); #1;
        LD = 0;
        $display("Stanje registra: A = %h (Ocekivano: FF)", A);

        // KORAK 2: Provera prenosa (Carry chain)
        $display("\n[KORAK 2] Aktiviramo INC i C0=1 da vidimo prenos kroz bite...");
        INC = 1; C0 = 1;
        #1; // Cekamo da se kombinatorna mreža smiri pre kloka
        $display("Unutrasnji prenos po bitovima:");
        $display("C1=%b, C2=%b, C3=%b, C4=%b, C5=%b, C6=%b, C7=%b -> Izlaz C8=%b", 
                  uut.C1, uut.C2, uut.C3, uut.C4, uut.C5, uut.C6, uut.C7, C8);
        
        @(posedge clk); #1;
        INC = 0; C0 = 0;
        $display("Nakon kloka: A = %h, C8 = %b", A, C8);

        // KORAK 3: Upis vrednosti 00 u registar
        $display("\n[KORAK 3] Upisujemo 8'h00 u registar...");
        LD = 1; I = 8'h00;
        @(posedge clk); #1;
        LD = 0;
        $display("Stanje registra: A = %h (Ocekivano: 00)", A);

        // KORAK 4: Provera pozajmice (Borrow chain)
        $display("\n[KORAK 4] Aktiviramo DEC i E0=1 da vidimo pozajmicu...");
        DEC = 1; E0 = 1;
        #1;
        $display("Unutrasnja pozajmica po bitovima:");
        $display("E1=%b, E2=%b, E3=%b, E4=%b, E5=%b, E6=%b, E7=%b -> Izlaz E8=%b", 
                  uut.E1, uut.E2, uut.E3, uut.E4, uut.E5, uut.E6, uut.E7, E8);
        
        @(posedge clk); #1;
        DEC = 0; E0 = 0;
        $display("Nakon kloka: A = %h, E8 = %b", A, E8);

        // KORAK 5: Provera sta se desava tokom CL (Clear) operacije
        $display("\n[KORAK 5] Testiramo Clear dok su ostali signali aktivni...");
        LD = 0; CL = 1; INC = 1; DEC = 1; C0 = 1; E0 = 1;
        #1;
        $display("Pre kloka (na Clear): C8 = %b, E8 = %b", C8, E8);
        @(posedge clk); #1;
        $display("Nakon kloka (na Clear): A = %h, C8 = %b, E8 = %b", A, C8, E8);

        $display("\n============================================================");
        $stop;
    end
endmodule