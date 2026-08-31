// ============================================================
// ROM_CPU.v
// Converted from ROM_CPU.vhd
// Cyclone V
// 1-Port ROM
// ============================================================

module ROM_CPU (
    input  wire [9:0]  address,
    input  wire        clock,
    input  wire        rden,
    output wire [31:0] q
);

    wire [31:0] sub_wire0;

    altsyncram #(
        .address_aclr_a        ("NONE"),
        .clock_enable_input_a  ("BYPASS"),
        .clock_enable_output_a ("BYPASS"),
        .init_file             ("../../tests/RISCV32I test/InicializationData.mif"),
        .intended_device_family("Cyclone V"),
        .lpm_hint              ("ENABLE_RUNTIME_MOD=NO"),
        .lpm_type              ("altsyncram"),
        .numwords_a            (1024),
        .operation_mode        ("ROM"),
        .outdata_aclr_a        ("NONE"),
        .outdata_reg_a         ("UNREGISTERED"),
        .widthad_a             (10),
        .width_a               (32),
        .width_byteena_a       (1)
    ) ROM_CPU_inst (
        .address_a (address),
        .clock0    (clock),
        .rden_a    (rden),
        .q_a       (sub_wire0)
    );

    assign q = sub_wire0;

endmodule
