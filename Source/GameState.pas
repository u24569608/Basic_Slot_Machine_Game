// GAME STATE 
unit GameState; 

{$mode objfpc}{$H+}

interface 

type 
    TGameState = class
        private 
            rCreditAmount, rBetAmount, rWinAmount : Real;
        public 
            constructor Construct(pCreditAmount, pBetAmount : Real);  

            procedure LoadCredit(pCreditAmountToLoad : Real);  
            function GetCredit : Real;  

            procedure SetBetAmount(pBetAmount : Real);  
            procedure DeductBet;  
            function GetBetAmount : Real;

            procedure SetWinAmount(pWinAmount : Real); 
            function GetWinAmount : Real; 
            procedure ResetWinAmount;

    end; 

implementation 

constructor TGameState.Construct(pCreditAmount, pBetAmount : Real); 
begin 
    rCreditAmount := pCreditAmount; 
    rBetAmount := pBetAmount; 
    rWinAmount := 0.00; 
end; 

procedure TGameState.LoadCredit(pCreditAmountToLoad : Real); 
begin
    if (pCreditAmountToLoad > 0) then 
            rCreditAmount := rCreditAmount + pCreditAmountToLoad; 
end; 

function TGameState.GetCredit : Real; 
begin
    Result := rCreditAmount; 
end; 

procedure TGameState.SetBetAmount(pBetAmount : Real);  
begin
    rBetAmount := pBetAmount; 
end; 

procedure TGameState.DeductBet; 
begin
    rCreditAmount := rCreditAmount - rBetAmount; 
end;   


function TGameState.GetBetAmount : Real;  
begin
    Result := rBetAmount; 
end; 

procedure TGameState.SetWinAmount(pWinAmount : Real); 
begin
    rWinAmount := pWinAmount; 
end; 

function TGameState.GetWinAmount : Real; 
begin
    Result := rWinAmount; 
end; 

procedure TGameState.ResetWinAmount;
begin
    rWinAmount := 0; 
end; 

end. 
