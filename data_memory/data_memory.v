module data_memory (
    input wire         clk,
    input wire         we, // MemWrite - habilitar escrita
    input wire  [31:0] a, // AluResult - endereco
    input wire  [31:0] wd, // WriteData - dados de entrada
    output wire [31:0] rd // ReadData - saida
);
    reg [31:0] ram [0:65535]; // memoria de 64k palavras

    assign rd = ram[a]; // Leitura assíncrona

    // Escrita síncrona
    always @(posedge clk) begin
        if (we)
            ram[a] <= wd;
    end

    // 1000 usado no instruction memory
    initial begin
        ram[32'h2000] = 32'd10;
    end
endmodule
