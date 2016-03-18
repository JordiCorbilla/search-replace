program SearchReplace;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  flickr.lib.folder in 'flickr.lib.folder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
