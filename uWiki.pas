unit uWiki;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmWiki = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Label1: TLabel;
    Layout1: TLayout;
    btn_voltar: TSpeedButton;
    btn_Tilapia: TButton;
    btn_Carpa: TButton;
    btn_Pacu: TButton;
    btn_Traira: TButton;
    Label2: TLabel;
    Layout2: TLayout;
    SpeedButton1: TSpeedButton;
    procedure btn_voltarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWiki: TfrmWiki;

implementation

{$R *.fmx}

uses uServicos;

procedure TfrmWiki.btn_voltarClick(Sender: TObject);
begin
  frmServicos.Show;
  Close;
end;

procedure TfrmWiki.SpeedButton1Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

end.
