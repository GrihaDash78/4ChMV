unit UProc1_2;

interface
uses SysUtils,Dialogs;

{загрузить инпут}
procedure OpenInp(var s,s1:string; FName:string);
{сохранить инпут}
procedure SaveInp(var s,s1:string; FName:string);
{функция подсчёта}
function CountFormul (x:real; y:real):real;

implementation

function CountFormul (x:real; y:real):real;
begin
  result := (abs(x)-abs(y))/(1 + abs(x*y));
  result:=result*10000;
  result:=round(result);
  result:=result/10000;
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
