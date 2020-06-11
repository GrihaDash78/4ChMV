unit UProc3_19;

interface

// Запись - «Расчёт»
type Calculation = record
v1, a1, v2, a2, s: real; // исходные данные
t: real;  // результат
end;

{загрузить инпут}
procedure OpenInp(var v1,a1,v2,a2,s:double; FName:string);
{сохранить инпут}
procedure SaveInp(v1,a1,v2,a2,s:double; FName:string);

{основная прцдр}
function TimeMeet (var v1, a1, v2, a2, s:double; var flag:boolean; var calcuta:Calculation):real;

implementation
function TimeMeet (var v1, a1, v2, a2, s:double; var flag:boolean; var calcuta:Calculation):real;
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

procedure OpenInp(var v1,a1,v2,a2,s:double; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
Reset(f);
readln(f,v1); {считываем построчно}
readln(f,a1);
readln(f,v2);
readln(f,a2);
readln(f,s);
closeFile(f);
end;

procedure SaveInp(v1,a1,v2,a2,s:double; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
rewrite(f);
writeln(f,v1);
writeln(f,a1);
writeln(f,v2);
writeln(f,a2);
writeln(f,s);
closeFile(f);
end;

end.
