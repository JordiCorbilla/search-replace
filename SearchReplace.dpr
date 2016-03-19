program SearchReplace;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  flickr.lib.folder in 'flickr.lib.folder.pas',
  thundax.lib.settings in 'thundax.lib.settings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
