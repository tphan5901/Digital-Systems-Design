@import VendingMachine

//90% wrong code
module VendingMachine_Testbench
// or
//module VendingMachine_Testbench();
//    input Clock, Reset,
//    input D_in, Q_in,
    reg Clock, Reset;
    reg D_in, Q_in;
    wire Dispense, Change;

    //signal Clock_tb, Reset_tb, D_in_tb, Q_in_tb;
    //signal Dispense_tb, Change_tb
//    localparam Clock_tb, Reset_tb, D_in_tb, Q_in_tb;
//    localparam Dispense_tb, Change_tb
    
//    always@(*)begin
    /*    
        DUT : Vending port map(Clock_tb, Reset_tb, D_in_tb, Q_in_tb, Dispense_tb, Change_tb)
    */
        Vending DUT (
            .Clock(Clock),
            .Reset(Reset),
            .D_in(D_in),
            .Q_in(Q_in),
            .Dispense(Dispense),
            .Change(Change)
        );

        /*
        Reset_STIM : process begin
            Reset_tb <= '0'; wait for 2 ns;
            Reset_tb <= '1'; wait;    
        end
        */

        //Reset Stimulus
        initial begin
            Reset = 1'b0;
            #2;
            Reset = 1'b1;
        end

        /*
        Clock_STIM : process begin
            Clock_tb <= '0'; wait for 10 ns;
            Clock_tb <= '1'; wait for 10 ns;    
        end
        */

        //Clock Stimulus
        initial begin
            Clock = 1'b0;
            forever #10 Clock = ~Clock;
        end

        /*
        D_in_STIM : process begin
            D_in_tb <= '0'; wait for 5 ns;
            D_in_tb <= '1'; wait for 5 ns;    
            D_in_tb <= '0'; wait;    
        end
        */

        //D_in Stimulus
        initial begin
            D_in = 1'b0;
            #5;
            D_in = 1'b1;
            #5;
            D_in = 1'b0;
        end

        /*
        Q_in_STIM : process begin
            Q_in_tb <= '0'; wait for 25 ns;
            Q_in_tb <= '1'; wait for 5 ns;    
            Q_in_tb <= '0'; wait for 15 ns;    

            Q_in_tb <= '1'; wait for 5 ns;    
            Q_in_tb <= '0'; wait for 15 ns;    

            Q_in_tb <= '1'; wait for 5 ns;    
            Q_in_tb <= '0'; wait for 15 ns;    
            
            wait;
        end
        */

        initial begin 
            Q_in = 1'b0;
            #25;
            Q_in = 1'b1;
            #5;
            Q_in = 1'b0;

            #15;
            Q_in = 1'b1;
            #5;
            Q_in = 1'b0;

            #15;
            Q_in = 1'b1;
            #5;
            Q_in = 1'b0;
        end

        //End Simulation
        initial begin
            #100;
            $finish;
        end

//    end

endmodule
