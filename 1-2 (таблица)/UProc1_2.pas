unit UProc1_2;

interface
uses SysUtils,Dialogs;
// Запись - «Расчёт»
type Calculation = record
x, y: real; // исходные данные
ch,zn,r: real;  // результат
end;

{загрузить инпут}
procedure OpenInp(var s,s1:string; FName:string);
{сохранить инпут}
procedure SaveInp(var s,s1:string; FName:string);
{функция подсчёта}
function CountFormul (x:real; y:real; var calcuta:Calculation):real;

implementation

function CountFormul (x:real; y:real; var calcuta:Calculation):real;
begin
  result := (abs(x)-abs(y))/(1 + abs(x*y));
  result:=result*10000;
  result:=round(result);
  result:=result/10000;
  calcuta.x:=x;
  calcuta.y:=y;
  calcuta.ch:=(abs(x)-abs(y));
  calcuta.zn:=(1 + abs(x*y));
  calcuta.r:=result;
end;

procedure OpenInp(var s,s1:string; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
Reset(f);
readln(f,s); {считываем построчно}
readln(f,s1);
closeFile(f);
end;

procedure SaveInp(var s,s1:string; FName:string);
var f:textfile;
begin
AssignFile(f,FName);
rewrite(f);
writeln(f,s);
writeln(f,s1);
closeFile(f);
end;

end.
