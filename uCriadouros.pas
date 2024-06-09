unit uCriadouros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    Layout1: TLayout;
    TabItem1: TTabItem;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Layout2: TLayout;
    btn_novoCriadouro: TButton;
    btn_gerenciarCri: TButton;
    btn_alimentar: TButton;
    btn_addPeixes: TButton;
    TabItem2: TTabItem;
    Layout3: TLayout;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    edt_nomeCri: TEdit;
    Label4: TLabel;
    edt_idCriadouro: TEdit;
    Label5: TLabel;
    edt_capacidadeCri: TEdit;
    Label6: TLabel;
    edt_especieCri: TEdit;
    Label7: TLabel;
    DateEdit1: TDateEdit;
    Label8: TLabel;
    btn_cadastrarCri: TButton;
    TabItem3: TTabItem;
    Layout4: TLayout;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    Layout5: TLayout;
    edt_pesquisarCri: TEdit;
    SpeedButton4: TSpeedButton;
    procedure btn_cadastrarCriClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btn_cadastrarCriClick(Sender: TObject);
begin

  ShowMessage('Criadouro cadastrado com sucesso!');

end;

end.
