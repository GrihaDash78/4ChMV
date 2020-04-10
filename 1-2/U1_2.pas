﻿unit U1_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.GIFImg, Vcl.Menus, UProc1_2;

type
  TF1_2 = class(TForm) //здесь класс формы
    B1: TButton;         //начало поля класса
    Formula: TImage;
    MeOut: TMemo;
    E1: TEdit;
    E2: TEdit;
    L1: TLabel;
    L2: TLabel; //какой-то объект данного класса
    MMenu: TMainMenu;
    NOpen: TMenuItem;
    NSave: TMenuItem;
    NSaveInput: TMenuItem;
    NSaveMemo: TMenuItem;
    NExit: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    NInfo: TMenuItem; //конец поля класса
    procedure B1Click(Sender: TObject); //методы класса
    procedure NInfoClick(Sender: TObject);
    procedure NOpenClick(Sender: TObject);      //если юзер откажется от выбора файла,
    procedure NSaveInputClick(Sender: TObject); //то возникнет исключение I/O error 103
    procedure NSaveMemoClick(Sender: TObject);
    procedure NExitClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F1_2: TF1_2;

implementation

{$R *.dfm}

procedure TF1_2.B1Click(Sender: TObject);
         var x, y, z: real;
begin
  x := StrToFloat(E1.Text);
  y := StrToFloat(E2.Text);
  z:=CountFormul(x,y);
  MeOut.Lines.Add('При X = ' + FloatToStr(x) + ' и Y = ' + FloatToStr(y));
  MeOut.Lines.Add('Результат: ' + FloatToStr(z));
  MeOut.SetFocus;
end;

{процедура для кнопки открыть}
procedure TF1_2.NOpenClick(Sender: TObject);
var FName,s,s1: string; {FName для удобства, чтобы имя файла автоматом ставилось}
f:textfile;
begin
if OpenDialog1.Execute then {открывает проверяет}
begin
FName := OpenDialog1.FileName; {присваивает в переменную имя файла, который мы выбрали}
AssignFile(f,FName);
Reset(f);
readln(f,s); {считываем построчно}
readln(f,s1);
E1.Text:=s; {заполняем}
E2.Text:=s1;
end;
closeFile(f);
end;

{процедура для кнопки сохранить, принцип тот же, построчный}
procedure TF1_2.NSaveInputClick(Sender: TObject);
var FName,s,s1: string;
f:textfile;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
AssignFile(f,FName);
rewrite(f);
s:=E1.Text;
s1:=E2.Text;
writeln(f,s);
writeln(f,s1);
closeFile(f);
end;
{прцдр сохранить отчёт}
procedure TF1_2.NSaveMemoClick(Sender: TObject);
var FName: string;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
MeOut.Lines.SaveToFile(FName);
end;
{закрыть прогу}
procedure TF1_2.NExitClick(Sender: TObject);
begin
close;
end;

procedure TF1_2.NInfoClick(Sender: TObject);
begin
ShowMessage('Задача: №2 из задачника'+#10+'Сделал: Булгару Г. из ИВТ-19-2');
end;

end.
