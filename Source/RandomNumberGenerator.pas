// BASIC RANDOM NUMBER GENERATOR
unit RandomNumberGenerator; 

{$mode objfpc}{$H+}

interface 

type 
    TRandomNumberGenerator = class
        public
            constructor Construct;
            function GenerateRN(pMin, pMax : Integer) : Integer;  
    end; 

implementation 

// Constructor
constructor TRandomNumberGenerator.Construct; 
begin
    Randomize; 
end; 

// Generate Random Number Function
function TRandomNumberGenerator.GenerateRN(pMin, pMax : Integer) : Integer; 
begin
    Result := Random(pMax - pMin + 1) + pMin; 
end; 

end. 