program Main; 

uses 
    SysUtils, SlotMachine;
var 
    sInput : String;
    rCreditAmount : Currency; 
    rBetAmount : Currency; 

    smSlotMachine : TSlotMachine; 
    iGameCount : Integer; 

begin 
    DefaultFormatSettings.CurrencyString := 'R';
    DefaultFormatSettings.CurrencyFormat := 0;

    rBetAmount := 4.40; // SET BET AMOUNT HERE

    iGameCount := 1; 
    Writeln('BASIC SLOT MACHINE GAME'); 
    Writeln('GAME BET AMOUNT: [' + FloatToStrF(rBetAmount, ffCurrency, 10, 2) + ']'); 
    Writeln('TO START, LOAD CREDIT FIRST');
    Writeln('1. LOAD CREDIT'); 
    Writeln('2. EXIT'); 

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

    while (smSlotMachine.GetGameState.GetCredit > 0) do 
        begin         
            Writeln('============================');
            Writeln('Game #: ' + IntToStr(iGameCount)); 
            Writeln('============================');
            Writeln('CREDIT:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetCredit, ffCurrency, 10, 2) + ']');
            Writeln('WIN:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetWinAmount, ffCurrency, 10, 2) + ']'); 
            Writeln('BET:' + #9 + '[' + FloatToStrF(smSlotMachine.GetGameState.GetBetAmount, ffCurrency, 10, 2) + ']');

            Writeln('1. SPIN'); 
            Writeln('2. LOAD CREDIT');
            Writeln('3. CASH OUT'); 
            Write('>>> ');
            Readln(sInput); 

            if (sInput = '1') then 
                begin
                    if (smSlotMachine.GetGameState.GetCredit < smSlotMachine.GetGameState.GetBetAmount) then 
                        begin 
                            Writeln('NOT ENOUGH CREDITS'); 
                        end
                    else 
                        begin
                            smSlotMachine.Spin; 
                            iGameCount := iGameCount + 1; 
                        end; 
                end
            else 
            if (sInput = '2') then 
                begin 
                    Write('Enter Credit Amount To Load (e.g. R100.00): R'); 
                    Readln(rCreditAmount); 
                    smSlotMachine.GetGameState.LoadCredit(rCreditAmount); 
                end
            else 
            if (sInput = '3') then
                begin
                    Writeln('CASH OUT [' + FloatToStrF(smSlotMachine.GetGameState.GetCredit, ffCurrency, 10, 2) + '] (Y/N)?'); 
                    Write('>>> '); 
                    Readln(sInput); 
                    if (sInput = 'Y') then 
                        begin
                            Halt(0); 
                        end;  
                end; 

            
        end; 
end. 