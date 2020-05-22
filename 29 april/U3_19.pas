unit U3_19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Menus, UProc3_19, Vcl.Grids;

type
  TF3_19 = class(TForm)     //здесь класс формы
    B1: TButton;
    E1V: TEdit;
    E2V: TEdit;
    ES: TEdit;
    E1A: TEdit;
    E2A: TEdit;
    L1V: TLabel;
    L1A: TLabel;
    L2A: TLabel;
    L2V: TLabel;
    L1: TLabel;             //какой-то объект данного класса
    L2: TLabel;
    LS: TLabel;
    MMenu: TMainMenu;
    NOpen: TMenuItem;
    NSaveMemo: TMenuItem;
    NExit: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    NInfo: TMenuItem;
    SGrid: TStringGrid;        //конец поля класса
    procedure B1Click(Sender: TObject);   //методы класса
    procedure NOpenClick(Sender: TObject);      //если юзер откажется от выбора файла,
    procedure NSaveInputClick(Sender: TObject); //то возникнет исключение I/O error 103
    procedure NSaveMemoClick(Sender: TObject);
    procedure NExitClick(Sender: TObject);
    procedure NInfoClick(Sender: TObject);
    {проверка ошибок ввода}
    function DataFromForm:boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F3_19: TF3_19;
  var v1, a1, v2, a2, s: double;
  var calcutaM: array[1..128] of Calculation;
  var calcuta: Calculation;
  row:integer;
implementation

{$R *.dfm}
{$I-}

function TF3_19.DataFromForm:boolean;
var err:string;
flag:boolean;
begin
  result:=false; flag:=false;

  if TryStrToFloat(E1v.text,v1) = false then
  begin
     err:=err+'Несовместимый тип v1'+#10;
     E1v.Color:=clRed; flag:=True;
  end
  else if (strtofloat(E1v.Text)<=0) then
    begin
    err:=err+'Значение v1 должно быть положительным'+#10;
    E1v.Color:=clRed; flag:=True;
    end
    else E1v.Color:=$00D1D5FF;

  if TryStrToFloat(E1a.text,a1) = false then
  begin
     err:=err+'Несовместимый тип a1'+#10;
     E1a.Color:=clRed; flag:=True;
  end
  else if (strtofloat(E1a.Text)<=0) then
    begin
    err:=err+'Значение a1 должно быть положительным'+#10;
    E1a.Color:=clRed; flag:=True;
    end
    else E1a.Color:=$00D1D5FF;

  if TryStrToFloat(E2v.text,v2) = false then
  begin
     err:=err+'Несовместимый тип v2'+#10;
     E2v.Color:=clRed; flag:=True;
  end
  else if (strtofloat(E2v.Text)<=0) then
    begin
    err:=err+'Значение v2 должно быть положительным'+#10;
    E2v.Color:=clRed; flag:=True;
    end
    else E2v.Color:=$00FED0C5;

  if TryStrToFloat(E2a.text,a2) = false then
  begin
     err:=err+'Несовместимый тип a2'+#10;
     E2a.Color:=clRed; flag:=True;
  end
  else if (strtofloat(E2a.Text)<=0) then
    begin
    err:=err+'Значение a2 должно быть положительным'+#10;
    E2a.Color:=clRed; flag:=True;
    end
    else E2a.Color:=$00FED0C5;

  if TryStrToFloat(ES.text,S) = false then
  begin
     err:=err+'Несовместимый тип S'+#10;
     ES.Color:=clRed; flag:=True;
  end
  else if (strtofloat(ES.Text)<=0) then
    begin
    err:=err+'Значение S должно быть положительным'+#10;
    ES.Color:=clRed; flag:=True;
    end
    else ES.Color:=clWhite;

  if flag = true then
  begin
  ShowMessage(err);
  exit;
  end;
  result:=true;
end;

procedure TF3_19.B1Click(Sender: TObject);
         var flag:boolean;
begin
  if DataFromForm = false then exit;
  TimeMeet(v1,a1,v2,a2,s,flag, calcuta);
  if flag = true then //определяем решаемость задачи
  begin
  Inc(row);
  SGrid.Cells[0, row]:=IntToStr(row);
  SGrid.Cells[1, row]:=FloatToStr(calcuta.v1);
  SGrid.Cells[2, row]:=FloatToStr(calcuta.a1);
  SGrid.Cells[3, row]:=FloatToStr(calcuta.v2);
  SGrid.Cells[4, row]:=FloatToStr(calcuta.a1);
  SGrid.Cells[5, row]:=FloatToStr(calcuta.s);
  SGrid.Cells[6, row]:=FloatToStr(calcuta.t);
  CalcutaM[row]:=calcuta;
  end
  else
    ShowMessage('При таких данных нет решения.');
end;

             {процедура для кнопки открыть}
procedure TF3_19.NOpenClick(Sender: TObject);
var s, s1, s2, s3, s4:string;
begin
if OpenDialog1.Execute then
        if OpenDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
          begin
OpenInp(s,s1,s2,s3,s4,OpenDialog1.FileName);
E1V.Text:=s; {заполняем}
E1A.Text:=s1;
E2V.Text:=s2;
E2A.Text:=s3;
ES.Text:=s4;
end;

end;

{процедура для кнопки сохранить, принцип тот же, построчный}
procedure TF3_19.NSaveInputClick(Sender: TObject);
var s, s1, s2, s3, s4:string;
begin
if SaveDialog1.Execute then
        if SaveDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
          begin
s:=F3_19.E1V.Text;
s1:=F3_19.E1A.Text;
s2:=F3_19.E2V.Text;
s3:=F3_19.E2A.Text;
s4:=F3_19.ES.Text;
SaveInp(s,s1,s2,s3,s4, OpenDialog1.FileName);
end;
end;

{прцдр сохранить отчёт}
procedure TF3_19.NSaveMemoClick(Sender: TObject);
var FName:string;
f:textfile;
i:integer;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
AssignFile(f,FName);
append(f);
  write(f,'Индекс':6);
  write(f,'V1':11);
  write(f,'A1':11);
  write(f,'V2':11);
  write(f,'A2':11);
  write(f,'Расстояние':13);
  write(f,'Результат':13);
  writeln(f);
for i:=1 to row do
 begin
  write(f,i:6);
  with calcutaM[i] do
  begin
    write(f,v1:11:3);
    write(f,a1:11:3);
    write(f,v2:11:3);
    write(f,a2:11:3);
    write(f,s:13:3);
    write(f,t:13:3);
  end;
  writeln(f);
 end;
closefile(f);
end;



{закрыть прогу}
procedure TF3_19.NExitClick(Sender: TObject);
begin
close;
end;

procedure TF3_19.NInfoClick(Sender: TObject);
begin
ShowMessage('Задача: №19 из задачника'+#10+'Сделал: Булгару Г. из ИВТ-19-2');
end;

begin

end.
