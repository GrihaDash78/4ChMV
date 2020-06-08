unit U1_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.GIFImg, Vcl.Menus, UProc1_2,
  Vcl.Grids;

type
  TF1_2 = class(TForm) //здесь класс формы
    B1: TButton;         //начало поля класса
    Formula: TImage;
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
    NInfo: TMenuItem;
    MeOut: TMemo; //конец поля класса
    procedure B1Click(Sender: TObject); //методы класса
    procedure NInfoClick(Sender: TObject);
    procedure NOpenClick(Sender: TObject);      //если юзер откажется от выбора файла,
    procedure NSaveInputClick(Sender: TObject); //то возникнет исключение I/O error 103
    procedure NSaveMemoClick(Sender: TObject);
    procedure NExitClick(Sender: TObject);

    {проверка ошибок ввода}
    function DataFromForm:boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F1_2: TF1_2;
  var x, y: double;
  clearmem:boolean;
  row:integer;
implementation

{$R *.dfm}
function TF1_2.DataFromForm:boolean;
var err:string;
flag:boolean;
begin
  result:=false; flag:=false;
  if TryStrToFloat(E1.text,x) = false then
  begin
     err:=err+'Несовместимый тип ввода X'+#10;
     E1.Color:=clRed; flag:=True;
  end
  else E1.Color:=clWhite;

  if TryStrToFloat(E2.text,y)=false then
    begin
    err:=err+'Несовместимый тип ввода Y'+#10;
    E2.Color:=clRed; flag:=True;
    end
  else E2.Color:=clWhite;

  if flag = true then
  begin
  ShowMessage(err);
  exit;
  end;
  result:=true;
end;

procedure TF1_2.B1Click(Sender: TObject);
var z:real;
begin
  if DataFromForm = False then exit;
  z:=CountFormul(x,y);
  Inc(row);
  if clearmem = False then MeOut.Clear;
  MeOut.Lines.Add('Счёт №'+IntToStr(row));
  MeOut.Lines.Add('При X = ' + FloatToStr(x) + ' и Y = ' + FloatToStr(y));
  MeOut.Lines.Add('Результат: ' + FloatToStr(z));
  MeOut.SetFocus;
  clearmem:=True;
end;

{процедура для кнопки открыть}
procedure TF1_2.NOpenClick(Sender: TObject);
var s,s1: string;
begin
if OpenDialog1.Execute then
        if OpenDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
          begin
 OpenInp(s,s1,OpenDialog1.FileName);
 E1.Text:=s; {заполняем}
 E2.Text:=s1;
 end;
end;

{процедура для кнопки сохранить, принцип тот же, построчный}
procedure TF1_2.NSaveInputClick(Sender: TObject);
var s,s1: string;
 begin
 if DataFromForm = False then exit;
 if SaveDialog1.Execute then
        if SaveDialog1.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
   begin
   s:=F1_2.E1.Text;
   s1:=F1_2.E2.Text;
   SaveInp(s,s1, SaveDialog1.FileName);
   end;
 end;

{прцдр сохранить отчёт}
procedure TF1_2.NSaveMemoClick(Sender: TObject);
begin
if SaveDialog1.Execute then
  if SaveDialog1.FileName <> '' then
MeOut.Lines.SaveToFile(SaveDialog1.FileName);
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
