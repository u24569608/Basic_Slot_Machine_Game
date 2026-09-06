// SLOT MACHINE
unit SlotMachine; 

{$mode objfpc}{$H+}

interface 

uses 
    RandomNumberGenerator, GameState, VirtualReel, PayTable; 

type 
    TSlotMachine = class
        private     
            gsGameState : TGameState; 
            rngRandomNumberGenerator : TRandomNumberGenerator; 
            vrVirtualReel : TVirtualReel; 
            ptPayTable : TPayTable; 

            // RANDOM NUMBERS
            iRN1, iRN2, iRN3 : Integer;    

            // SYMBOLS
            cSymbol1, cSymbol2, cSymbol3 : Char;  

            sSymbolCombination : String; 
        public 
            constructor Construct(pCreditAmount, pBetAmount : Currency);  
            destructor Destroy; override;
            procedure Spin;    
            function GetGameState : TGameState;       
    end; 

implementation 

constructor TSlotMachine.Construct(pCreditAmount, pBetAmount : Currency); 
begin 
    gsGameState := TGameState.Construct(pCreditAmount, pBetAmount); 
    rngRandomNumberGenerator := TRandomNumberGenerator.Construct; 
    vrVirtualReel := TVirtualReel.Construct; 
    ptPayTable := TPayTable.Construct; 
end; 

destructor TSlotMachine.Destroy;
begin
    ptPayTable.Free;
    vrVirtualReel.Free;
    rngRandomNumberGenerator.Free;
    gsGameState.Free;
    inherited Destroy;
end;

procedure TSlotMachine.Spin; 
begin
    Writeln('============================');
    Writeln('GOOD LUCK'); 

    // Generate THREE Random Numbers
    iRN1 := rngRandomNumberGenerator.GenerateRN(1, 10); 
    iRN2 := rngRandomNumberGenerator.GenerateRN(1, 10); 
    iRN3 := rngRandomNumberGenerator.GenerateRN(1, 10); 

    // Determine RESPECTIVE SYMBOLS of Random Numbers from Virtual Reel
    cSymbol1 := vrVirtualReel.GetSymbolFromRN(iRN1);
    cSymbol2 := vrVirtualReel.GetSymbolFromRN(iRN2); 
    cSymbol3 := vrVirtualReel.GetSymbolFromRN(iRN3); 

    
    Writeln('+-----------+'); 
    Writeln('| ' + cSymbol1 + ' | ' + cSymbol2 + ' | ' + cSymbol3 + ' |'); 
    Writeln('+-----------+'); 

    sSymbolCombination := cSymbol1 + cSymbol2 + cSymbol3; 

    gsGameState.DeductBet; 
    gsGameState.SetWinAmount(ptPayTable.GetWinAmount(sSymbolCombination, gsGameState.GetBetAmount)); 
    gsGameState.LoadCredit(gsGameState.GetWinAmount); 

    if (gsGameState.GetWinAmount > 0) then 
        begin
            Writeln('WELL DONE. GAME OVER'); 
            Writeln('============================'); 
        end
    else 
        begin
            Writeln('TOO BAD. GAME OVER'); 
            Writeln('============================');
        end; 
end; 

function TSlotMachine.GetGameState : TGameState; 
begin
    Result := gsGameState; 
end; 

end. 
