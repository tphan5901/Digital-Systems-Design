//vending machine controller 

module VendingMachine (
    input clock, reset,
    input D_in, Q_in,
    output reg Dispense,
    output reg Change
)
    parameter sWait = 2'b00, s25c = 2'b01, s50c = 2'b10;
    //type State_Type is (isWait, s25c, s50c);
    // signal current_state, next_state : State_Type;
    reg[3:0] current_state, next_state;

    always @(posedge clock, negedge reset) begin
        if(!reset)
        //if(reset):
            current_state <= sWait;
        else (rising_edge(clock)):
            current_state <= next_state;   
    end

    //next state
    always@(*) begin
        next_state = current_state;
    //Next_State_Logic : process(current_state, Q_in, D_in) begin (vdhl code)
        case(current_state)
            sWait: begin
            //when sWait => 
                if (Q_in = '1'):
                    next_state <= s25c;
                else
                    next_state <= sWait;
            end

            s25c: begin
            //when s25c =>
                if (Q_in = '1'):
                        next_state <= s50c;
                    else
                        next_state <= s25c;
            end

            s50c: begin
            //when s25c =>
                if (Q_in = '1'):
                        next_state <= sWait;
                    else
                        next_state <= s50c;
            end
            default:
                next_state <= sWait;
        endcase
    end

    //output
    always@(*) begin
    //Output_Logic : process(current_state, Q_in, D_in) begin (vdhl code)
        Dispense = 1'b0;
        Change = 1'b0;
        case(current_state)
            sWait: begin
            //when sWait => 
                //if (D_in = '1'):
                //    Dispense <= '1';
                //    Change <= '1';
                if(D_in) begin
                    Dispense = 1'b1;
                    Change = 1'b1;
                else
                    Dispense <= '0'
                    Change <= '0';
                end
            end
            
            //s25c:
            s25: begin
            //    Dispense <= '0';
            //    Change <= '0';
                Dispense = 1'b0;
                Change = 1'b0;
            end

            //s50c:
            s50: begin
            /*
                if (Q_in = '1'):
                    Dispense <= '1';
                    Change <= '0';
                else
                    Dispense <= '0'
                    Change <= '0';
            */
                if(Q_in) begin
                    Dispense = 1'b1;
                    Change = 1'b0;
                end
            end
            /*default:
                Dispense <= '0';
                Change <= '0';
            */
            default: begin
                Dispense = 1'b0;
                Change = 1'b0;
            end
        endcase
    end

endmodule