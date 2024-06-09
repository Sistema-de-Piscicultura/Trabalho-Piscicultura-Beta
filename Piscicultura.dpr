program Piscicultura;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uServicos in 'uServicos.pas' {frmServicos},
  uWiki in 'uWiki.pas' {frmWiki},
  uCriadouros in 'uCriadouros.pas' {Form1},
  uRelatorios in 'uRelatorios.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmServicos, frmServicos);
  Application.CreateForm(TfrmWiki, frmWiki);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
