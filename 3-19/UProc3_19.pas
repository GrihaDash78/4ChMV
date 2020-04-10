unit UProc3_19;

interface
function TimeMeet (v1, a1, v2, a2, s:real; var flag:boolean):real;
implementation
function TimeMeet (v1, a1, v2, a2, s:real; var flag:boolean):real;
var d:real;
begin
d := (v1 + v2) * (v1 + v2) - (2 * (a1 + a2) * (-s)); //высчитываем дискриминант
  if d >= 0 then //определяем решаемость задачи
  begin
    flag:=True;
    result := (-(v1 + v2) + sqrt(d)) / 2 * ((a1 + a2) / 2); //высчитываем положительный корень по формуле
    result:=result*1000; result:=round(result); result:=result/1000;
  end;
end;
end.
