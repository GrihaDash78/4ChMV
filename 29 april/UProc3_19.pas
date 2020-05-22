unit UProc3_19;

interface

// Запись - «Расчёт»
type Calculation = record
v1, a1, v2, a2, s: real; // исходные данные
t: real;  // результат
end;

{загрузить инпут}
procedure OpenInp(var s,s1,s2,s3,s4:string; FName:string);
{сохранить инпут}
procedure SaveInp(var s,s1,s2,s3,s4:string; FName:string);

{основная прцдр}
function TimeMeet (v1, a1, v2, a2, s:real; var flag:boolean; var calcuta:Calculation):real;

implementation
function TimeMeet (v1, a1, v2, a2, s:real; var flag:boolean; var calcuta:Calculation):real;
var d:real;
begin
d := (v1 + v2) * (v1 + v2) - (2 * (a1 + a2) * (-s)); //высчитываем дискриминант
  if d >= 0 then //определяем решаемость задачи
  begin
    flag:=True;
    result := (-(v1 + v2) + sqrt(d)) /( 2 * ((a1 + a2) / 2)); //высчитываем положительный корень по формуле
    result:=result*1000; result:=round(result); result:=result/1000;
    calcuta.v1:=v1;
    calcuta.a1:=a1;
    calcuta.v2:=v2;
    calcuta.a2:=a2;
    calcuta.s:=s;
    calcuta.t:=result;
  end;
end;

procedure OpenInp(var s,s1,s2,s3,s4:string; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
Reset(f);
readln(f,s); {считываем построчно}
readln(f,s1);
readln(f,s2);
readln(f,s3);
readln(f,s4);
closeFile(f);
end;

procedure SaveInp(var s,s1,s2,s3,s4:string; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
rewrite(f);
writeln(f,s);
writeln(f,s1);
writeln(f,s2);
writeln(f,s3);
writeln(f,s4);
closeFile(f);
end;

end.
