// GAME STATE 
unit GameState; 

{$mode objfpc}{$H+}

interface 

type 
    TGameState = class
        private 
            rCreditAmount, rBetAmount, rWinAmount : Currency;
        public 
            constructor Construct(pCreditAmount, pBetAmount : Currency);  

            procedure LoadCredit(pCreditAmountToLoad : Currency);  
            function GetCredit : Currency;  

            procedure SetBetAmount(pBetAmount : Currency);  
            procedure DeductBet;  
            function GetBetAmount : Currency;

            procedure SetWinAmount(pWinAmount : Currency); 
            function GetWinAmount : Currency; 
            procedure ResetWinAmount;

    end; 

implementation 

constructor TGameState.Construct(pCreditAmount, pBetAmount : Currency); 
begin 
    rCreditAmount := pCreditAmount; 
    rBetAmount := pBetAmount; 
    rWinAmount := 0.00; 
end; 

procedure TGameState.LoadCredit(pCreditAmountToLoad : Currency); 
begin
    if (pCreditAmountToLoad > 0) then 
            rCreditAmount := rCreditAmount + pCreditAmountToLoad; 
end; 

function TGameState.GetCredit : Currency; 
begin
    Result := rCreditAmount; 
end; 

procedure TGameState.SetBetAmount(pBetAmount : Currency);  
begin
    rBetAmount := pBetAmount; 
end; 

procedure TGameState.DeductBet; 
begin
    rCreditAmount := rCreditAmount - rBetAmount; 
end;   


function TGameState.GetBetAmount : Currency;  
begin
    Result := rBetAmount; 
end; 

procedure TGameState.SetWinAmount(pWinAmount : Currency); 
begin
    rWinAmount := pWinAmount; 
end; 

function TGameState.GetWinAmount : Currency; 
begin
    Result := rWinAmount; 
end; 

procedure TGameState.ResetWinAmount;
begin
    rWinAmount := 0; 
end; 

end. 
