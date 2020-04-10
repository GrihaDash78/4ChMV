unit UProc1_2;

interface
uses SysUtils,Dialogs;
function CountFormul (x:real; y:real):real;
implementation
function CountFormul (x:real; y:real):real;
begin
  result := (abs(x)-abs(y))/(1 + abs(x*y));
  result:=result*10000;
  result:=round(result);
  result:=result/10000;
end;
end.
