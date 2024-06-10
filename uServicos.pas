unit uServicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmServicos = class(TForm)
    btn_wiki: TButton;
    btn_criadouros: TButton;
    btn_relatorio: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_sair: TButton;
    procedure btn_wikiClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_criadourosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicos: TfrmServicos;

implementation

{$R *.fmx}

uses uWiki, uPrincipal, uCriadouros;

procedure TfrmServicos.btn_criadourosClick(Sender: TObject);
begin
  frmCriadouros.Show;
end;

procedure TfrmServicos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmServicos.btn_wikiClick(Sender: TObject);
begin
  frmWiki.Show;
end;

end.
