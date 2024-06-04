unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    btn_entrar: TButton;
    btn_cadastrar: TButton;
    edt_login: TEdit;
    edt_senha: TEdit;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout1: TLayout;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edt_cpfCad: TEdit;
    Label3: TLabel;
    edt_nomeCad: TEdit;
    edt_emailCad: TEdit;
    edt_senhaCad: TEdit;
    edt_telefoneCad: TEdit;
    btn_salvarCad: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure btn_entrarClick(Sender: TObject);
    procedure btn_cadastrarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_salvarCadClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses uServicos;




procedure TfrmPrincipal.btn_cadastrarClick(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure TfrmPrincipal.btn_entrarClick(Sender: TObject);
begin
  frmServicos.Show;
end;



procedure TfrmPrincipal.btn_salvarCadClick(Sender: TObject);
begin
  ShowMessage('Cadastro Realizado!');
  TabControl1.TabIndex := 0;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

end.
