program P3_19;

uses
  Forms,
  U3_19 in 'U3_19.pas' {Form1},
  UProc3_19 in 'UProc3_19.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF3_19, F3_19);
  F3_19.SGrid.Cells[0, 0]:='Индекс';
    F3_19.SGrid.Cells[1, 0]:='V1';
  F3_19.SGrid.Cells[2, 0]:='A1';
    F3_19.SGrid.Cells[3, 0]:='V2';
  F3_19.SGrid.Cells[4, 0]:='A2';
    F3_19.SGrid.Cells[5, 0]:='Расстояние';
  F3_19.SGrid.Cells[6, 0]:='Результат';
  Application.Run;
end.
