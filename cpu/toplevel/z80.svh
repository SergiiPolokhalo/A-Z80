
`ifndef Z80_IFC
`define Z80_IFC

interface z80_if (input logic CLK);
    logic nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK;
    logic nINT, nNMI, nRESET, nBUSRQ;
    logic [15:0] A;
    wire  [7:0] D;
    
//=================================================
// Modport for the CPU module (internal) interface
// Also considered "design under test" port
//=================================================
modport dut (
    output nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK,
    input  nINT, nNMI, nRESET, nBUSRQ,
    input  CLK,
    output A,
    inout  D);

//=================================================
// Modport for the user (external) pin interface
// Also considered a "test bench" port
//=================================================
modport tb (
    input  nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK,
    output nINT, nNMI, nRESET, nBUSRQ,
    input  CLK,
    input  A,
    inout  D);

endinterface : z80_if

`endif
