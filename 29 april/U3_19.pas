﻿unit U3_19;

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

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F3_19: TF3_19;
  var calcutaM: array[1..128] of Calculation;
  var calcuta: Calculation; //отдельная запись для процедуры подсчёта
  row:integer; //счётчик заполненных строк
implementation

{$R *.dfm}
{$I-}

procedure TF3_19.B1Click(Sender: TObject);
         var v1, a1, v2, a2, t, s: real;
         flag:boolean;
begin
  v1 := StrToFloat(E1V.Text);
  a1 := StrToFloat(E1A.Text);
  v2 := StrToFloat(E2V.Text);
  a2 := StrToFloat(E2A.Text);
  s := StrToFloat(ES.Text);
  t:=TimeMeet(v1,a1,v2,a2,s,flag, calcuta);
  if flag = true then //определяем решаемость задачи
  begin
  Inc(row);                                   
  SGrid.Cells[0, row]:=IntToStr(row);         //заполняем номер строки
  SGrid.Cells[1, row]:=FloatToStr(calcuta.v1);//заполняем исходные данные
  SGrid.Cells[2, row]:=FloatToStr(calcuta.a1);
  SGrid.Cells[3, row]:=FloatToStr(calcuta.v2);
  SGrid.Cells[4, row]:=FloatToStr(calcuta.a1);
  SGrid.Cells[5, row]:=FloatToStr(calcuta.s);
  SGrid.Cells[6, row]:=FloatToStr(calcuta.t); //и результат
  CalcutaM[row]:=calcuta;                    //добавляем запись в массив
  end
  else
    ShowMessage('При таких данных нет решения.');
    //хз, но по мне незачем добавлять в массив и таблицу записи без решения
end;

             {процедура для кнопки открыть}
procedure TF3_19.NOpenClick(Sender: TObject);
var FName,s,s1,s2,s3,s4: string; {FName для удобства, чтобы имя файла автоматом ставилось}
f:textfile;
begin
if OpenDialog1.Execute then {открывает проверяет}
begin
FName := OpenDialog1.FileName; {присваивает в переменную имя файла, который мы выбрали}
AssignFile(f,FName);
Reset(f);
readln(f,s); {считываем построчно}
readln(f,s1);
readln(f,s2);
readln(f,s3);
readln(f,s4);
E1V.Text:=s; {заполняем}
E1A.Text:=s1;
E2V.Text:=s2;
E2A.Text:=s3;
ES.Text:=s4;
end;
closeFile(f);
end;

{процедура для кнопки сохранить, принцип тот же, построчный}
procedure TF3_19.NSaveInputClick(Sender: TObject);
var FName,s,s1,s2,s3,s4: string;
f:textfile;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
AssignFile(f,FName);
rewrite(f);
s:=E1V.Text;
s1:=E1A.Text;
s2:=E2V.Text;
s3:=E2A.Text;
s4:=ES.Text;
writeln(f,s);
writeln(f,s1);
writeln(f,s2);
writeln(f,s3);
writeln(f,s4);
closeFile(f);
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
    write(f,v1:8:3);
    write(f,a1:8:3);
    write(f,v2:8:3);
    write(f,a2:8:3);
    write(f,s:10:3);
    write(f,t:10:3);
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
