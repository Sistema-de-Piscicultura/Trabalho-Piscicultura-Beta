program Piscicultura;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uServicos in 'uServicos.pas' {frmServicos},
  uWiki in 'uWiki.pas' {frmWiki};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmServicos, frmServicos);
  Application.CreateForm(TfrmWiki, frmWiki);
  Application.Run;
end.
