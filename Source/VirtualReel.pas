// VIRTUAL REEL 
unit VirtualReel; 

{$mode objfpc}{$H+}

interface 

type 
    TVirtualReel = class
        private                    
            arrSymbols : array[1..10] of Char; 
        public 
            constructor Construct; 
            function GetSymbolFromRN(pRandomNumber : Integer) : Char;            
    end; 

implementation 

constructor TVirtualReel.Construct; 
begin 
    arrSymbols[1] := 'A'; 
    arrSymbols[2] := 'A'; 
    arrSymbols[3] := 'A'; 
    arrSymbols[4] := 'A'; 
    arrSymbols[5] := 'A'; 
    arrSymbols[6] := 'B'; 
    arrSymbols[7] := 'B'; 
    arrSymbols[8] := 'B'; 
    arrSymbols[9] := 'C'; 
    arrSymbols[10] := 'C'; 
end; 

function TVirtualReel.GetSymbolFromRN(pRandomNumber : Integer) : Char;
begin
    Result := arrSymbols[pRandomNumber]; 
end;

end. 