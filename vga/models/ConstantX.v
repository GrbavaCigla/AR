// =====================================================================
// ConstantX.v
//
// Verilog ekvivalent fajla ConstantX.vhd:
//
//   generic ( size : natural := 16; const : integer := 0 );
//   DATA_OUT <= std_logic_vector(to_signed(const, size));
//
// tj. DATA_OUT je 'const' upisan kao signed vrednost sirine 'size' bita.
// Imena generika/parametara i porta su ista kao u originalu, tako da
// postojeci defparam pozivi (npr. defparam inst.const = 9000; defparam
// inst.size = 16;) rade bez izmena.
// =====================================================================

module ConstantX(DATA_OUT);
    parameter size  = 16;
    parameter const = 0;
    output [size-1:0] DATA_OUT;
    assign DATA_OUT = const[size-1:0];
endmodule
