module data_memory_tb;
    reg         clk;
    reg         we;
    reg  [31:0] a;
    reg  [31:0] wd;
    wire [31:0] rd;

    data_memory dut (
        .clk(clk),
        .we(we),
        .a(a),
        .wd(wd),
        .rd(rd)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 0;
        a = 0;
        wd = 0;

        // Leitura da posição 0x2000
        #5;
        a = 32'h2000;
        #5; // leitura assíncrona

        // Escrita em 0x2000
        we = 1;
        wd = 32'd25;
        #10;
        we = 0;

        // Leitura após escrita
        #10;

        // Escrita em outro endereço
        we = 1;
        a = 32'h00000010;
        wd = 32'd32;
        #10;
        we = 0;

        // Leitura do novo endereço h00000010
        #10;

        #30;
        $finish;
    end

    initial begin
        $dumpfile("data_memory_tb.vcd");
        $dumpvars(0, data_memory_tb);
    end
endmodule
