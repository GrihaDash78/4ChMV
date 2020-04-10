unit U3_19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Menus, UProc3_19;

type
  TF3_19 = class(TForm)     //����� ����� �����
    B1: TButton;            //������ ���� ������
    MeOut: TMemo;
    E1V: TEdit;
    E2V: TEdit;
    ES: TEdit;
    E1A: TEdit;
    E2A: TEdit;
    L1V: TLabel;
    L1A: TLabel;
    L2A: TLabel;
    L2V: TLabel;
    L1: TLabel;             //�����-�� ������ ������� ������
    L2: TLabel;
    LS: TLabel;
    MMenu: TMainMenu;
    NOpen: TMenuItem;
    NSaveMemo: TMenuItem;
    NExit: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    NInfo: TMenuItem;        //����� ���� ������
    procedure B1Click(Sender: TObject);   //������ ������
    procedure NOpenClick(Sender: TObject);      //���� ���� ��������� �� ������ �����,
    procedure NSaveInputClick(Sender: TObject); //�� ��������� ���������� I/O error 103
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
  MeOut.Lines.Add('������ ���: V1 = '+E1V.Text+'  A1 = '+E1A.Text+'    V2 = '+E2V.Text+'  A2 = '+E2A.Text);
  MeOut.Lines.Add('���������� = ' + ES.Text);
  t:=TimeMeet(v1,a1,v2,a2,s,flag);
  if flag = true then //���������� ���������� ������
  begin
    MeOut.Lines.Add('���������: ���� ���������� �����: ' + FloatToStr(t) + ' ������ '); //����� ����������
    MeOut.SetFocus;
  end
  else
    MeOut.Lines.Add('���������: ��� �������.');
    MeOut.SetFocus;
end;

             {��������� ��� ������ �������}
procedure TF3_19.NOpenClick(Sender: TObject);
var FName,s,s1,s2,s3,s4: string; {FName ��� ��������, ����� ��� ����� ��������� ���������}
f:textfile;
begin
if OpenDialog1.Execute then {��������� ���������}
begin
FName := OpenDialog1.FileName; {����������� � ���������� ��� �����, ������� �� �������}
AssignFile(f,FName);
Reset(f);
readln(f,s); {��������� ���������}
readln(f,s1);
readln(f,s2);
readln(f,s3);
readln(f,s4);
E1V.Text:=s; {���������}
E1A.Text:=s1;
E2V.Text:=s2;
E2A.Text:=s3;
ES.Text:=s4;
end;
closeFile(f);
end;

{��������� ��� ������ ���������, ������� ��� ��, ����������}
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
{����� ��������� �����}
procedure TF3_19.NSaveMemoClick(Sender: TObject);
var FName:string;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
MeOut.Lines.SaveToFile(FName);
end;

{������� �����}
procedure TF3_19.NExitClick(Sender: TObject);
begin
close;
end;

procedure TF3_19.NInfoClick(Sender: TObject);
begin
ShowMessage('������: �19 �� ���������'+#10+'������: ������� �. �� ���-19-2');
end;

end.
