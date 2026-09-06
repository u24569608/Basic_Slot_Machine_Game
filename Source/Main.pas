program Main; 

uses 
    SysUtils, SlotMachine;
var 
    sInput : String;
    rCreditAmount : Real; 
    rBetAmount : Real; 

    smSlotMachine : TSlotMachine; 


begin 
    rBetAmount := 4.40;

    Writeln('GAME BET AMOUNT: [' + FloatToStrF(rBetAmount, ffCurrency, 10, 2) + ']'); 
    Writeln('TO START, LOAD CREDIT FIRST');
    Writeln('1. Load Credit'); 
    Writeln('2. Exit'); 

    Write('>>> '); 
    Readln(sInput); 

    if (sInput = '1') then 
        begin
            // Set Initial Credit 
            Write('Enter Credit Amount To Load (e.g. R100.00): R'); 
            Readln(rCreditAmount); 

            // Create 
            smSlotMachine := TSlotMachine.Construct(rCreditAmount, rBetAmount);
        end
    else 
        begin
            Halt(0); 
        end; 

    while (rCreditAmount > 0) do 
        begin         
            Writeln('CREDIT:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetCredit, ffCurrency, 10, 2) + ']');
            Writeln('WIN:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetWinAmount, ffCurrency, 10, 2) + ']'); 
            Writeln('BET:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetBetAmount, ffCurrency, 10, 2) + ']');

            Writeln('1. SPIN'); 
            Writeln('2. CASH OUT'); 
            Write('>>> ');
            Readln(sInput); 

            if (sInput = '1') then 
                begin
                    smSlotMachine.Spin; 
                end;

            
        end; 
end. 