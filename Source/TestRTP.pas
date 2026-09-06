program TestRTP;

{$mode objfpc}{$H+}

uses
    SysUtils, RandomNumberGenerator, VirtualReel, PayTable;

const
    Spin_Count = 20000000 ;
    Bet_Amount = 4.40;
var
    rngRandomNumberGenerator : TRandomNumberGenerator;
    vrVirtualReel : TVirtualReel;
    ptPayTable : TPayTable;

    iSpin : Int64;
    sCombination : String;
    rTotalBet, rTotalPayout, rPayout, rRTP : Real;
begin
    rngRandomNumberGenerator := TRandomNumberGenerator.Construct;
    vrVirtualReel := TVirtualReel.Construct;
    ptPayTable := TPayTable.Construct;

    rTotalBet := 0;
    rTotalPayout := 0;

    for iSpin := 1 to Spin_Count do
        begin
            sCombination :=
                vrVirtualReel.GetSymbolFromRN(rngRandomNumberGenerator.GenerateRN(1, 10)) +
                vrVirtualReel.GetSymbolFromRN(rngRandomNumberGenerator.GenerateRN(1, 10)) +
                vrVirtualReel.GetSymbolFromRN(rngRandomNumberGenerator.GenerateRN(1, 10));

            rPayout := ptPayTable.GetWinAmount(sCombination, Bet_Amount);

            rTotalBet := rTotalBet + Bet_Amount;
            rTotalPayout := rTotalPayout + rPayout;
        end;

    rRTP := (rTotalPayout / rTotalBet) * 100;

    Writeln('Spins: ', Spin_Count);
    Writeln('Total Bet: ', FloatToStrF(rTotalBet, ffCurrency, 10, 2));
    Writeln('Total Payout: ' + FloatToStrF(rTotalPayout, ffCurrency, 10, 2));
    Writeln('Simulated Return to Player (RTP): ' + FloatToStrF(rRTP, ffFixed, 10, 4) + '%');

    ptPayTable.Free;
    vrVirtualReel.Free;
    rngRandomNumberGenerator.Free;
end.
