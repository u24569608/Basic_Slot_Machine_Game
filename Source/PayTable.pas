// PAY TABLE
unit PayTable; 

{$mode objfpc}{$H+}

interface 

type 
    TPayTable = class
        private     
            function GetMultiplier(pSymbolCombination : String) : Integer; 
        public 
            constructor Construct;  
            function GetWinAmount(pSymbolCombination : String; pBet : Currency) : Currency;  
    end; 

implementation 

constructor TPayTable.Construct; 
begin 

end; 

function TPayTable.GetMultiplier(pSymbolCombination : String) : Integer; 
begin
    case (pSymbolCombination) of 
        // MULTIPLIERS FOR SYMBOL COMBINATIONS
        'AAA': Result := 1; 
        'BBB': Result := 2; 
        'CCC': Result := 80; 
    else 
        Result := 0; 
    end;
end; 

function TPayTable.GetWinAmount(pSymbolCombination : String; pBet : Currency) : Currency; 
var
    iMultiplier : Integer; 
begin
    iMultiplier := GetMultiplier(pSymbolCombination); 
    Result := pBet * iMultiplier; 
end; 

end. 