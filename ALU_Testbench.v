
module ALU_Testbench();
    parameter W = 8;
    reg [1:0] opcode;
    reg [W-1:0] operand_A, operand_B;
    wire [W-1:0] alu_result;
    wire [2:0] flags;

    alu #(.W(W)) DUT(
        .opcode(opcode),
        .operand_A(operand_A),
        .operand_B(operand_B),
        .alu_result(alu_result),
        .flags(flags)
    );

    initial begin
        // 2'b01 = 2bit opcode for sub
        // 2'b00 = 2bit opcode for adding
        // 2'b10 = 2bit opcode for 'and'
        // 2'b11 = 2bit opcode for 'or'

        operand_A = 8'd32; //assign value of 32 as 8bit decimal
        operand_B = 8'd32; // assign value of 32 as 8bit decimal = 0010 0000
        opcode = 2'b00; //add
        #2
        opcode = 2'b01; //sub, check for z flag
        #2;

        operand_A = 8'b1010_1010;
        operand_B = 8'b0101_0101;
        opcode = 2'b10; //and, check for z flag
        #2;
        opcode = 2'b11; //or, check for z flag
        #2;

        operand_A = 8'b1111_1111;
        operand_B = 8'b0000_0001;
        opcode = 2'b00; //add check for z flag
        #2;

        operand_A = 8'd0;
        operand_B = 8'd0; 
        opcode = 2'b00;  //add, check for z flag
        #2

        operand_A = 8'b0111_1111;
        operand_B = 8'b1111_1111;
        opcode = 2'b01; //sub, check for N flag
        #2 $finish;

    end

endmodule