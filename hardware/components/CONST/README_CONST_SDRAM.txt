SDRAM command constants for current sdram_controller.bdf

The current controller maps:
  CMD[8]   -> RAS_N
  CMD[7]   -> CAS_N
  CMD[6]   -> WE_N
  CMD[5..4]-> BA[1..0]
  CMD[3]   -> A10

CS_N is currently generated separately as NOT(CS), so it is not encoded in these words.

Constants:
  CONST_CMD_NOP_16b     = 16'd448 = 16'h01C0
      CMD[8:6] = 111 => RAS_N=1, CAS_N=1, WE_N=1

  CONST_CMD_PALL_16b    = 16'd136 = 16'h0088
      CMD[8:6] = 010 => PRECHARGE
      CMD[3]   = 1   => A10=1 => PRECHARGE ALL

  CONST_CMD_REFRESH_16b = 16'd64 = 16'h0040
      CMD[8:6] = 001 => AUTO REFRESH

  CONST_CMD_MRS_16b = 16'd0
     In the current controller encoding: RAS_N=0, CAS_N=0, WE_N=0; BA=00 and A10=0.

  CONST_MODE_030_13b = 13'd48 = 13'h030
     Mode register: BL=1, sequential, CAS latency=3, normal operation, programmed write burst.

  CONST_CMD_READ_16b = 16'd320
    RAS_N=1, CAS_N=0, WE_N=1

  CONST_CMD_WRITE_16b = 16'd256
    RAS_N=1, CAS_N=0, WE_N=0

