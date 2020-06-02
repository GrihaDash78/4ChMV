program P1_2;

uses
  Forms,
  U1_2 in 'U1_2.pas' {F1_2},
  UProc1_2 in 'UProc1_2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF1_2, F1_2);
  Application.Run;
end.
