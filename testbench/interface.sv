`define ADDR_BUS_WIDTH 32        // Width of Address bus i.e. PADDR
`define DATA_BUS_WIDTH 32        // Width of Data bus (i.e. PWDATA and PRDATA)

interface apb_if (input logic PCLK, PRESETn);
  
  logic PSEL;
  logic PENABLE;
  logic PWRITE;
  logic [`ADDR_BUS_WIDTH-1:0]    PADDR;
  logic [`DATA_BUS_WIDTH-1:0]    PWDATA;
  logic [`DATA_BUS_WIDTH-1:0]    PRDATA;
  logic PREADY;
  logic PSLVERR;

endinterface
