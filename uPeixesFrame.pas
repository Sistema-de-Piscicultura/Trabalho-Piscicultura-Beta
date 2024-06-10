unit uPeixesFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TFrmListaPeixes = class(TFrame)
    edt_qtde: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    Label1: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses uCriadouros;

procedure TFrmListaPeixes.SpeedButton1Click(Sender: TObject);
var qtde, I: Integer;
  inserindoItem : Boolean;
  peixe : TPeixe;
begin

  qtde := StrToInt(edt_qtde.Text);

  if qtde > 0 then
    qtde := qtde-1
  else
    qtde := 0;

  edt_qtde.Text := qtde.ToString;

  peixe.cod_peixe := StrToInt(lbl_codigo.Text);
  peixe.nome_peixe := lbl_nome.Text;
  peixe.qtde := qtde;

end;

procedure TFrmListaPeixes.SpeedButton2Click(Sender: TObject);
var qtde, I: Integer;
  inserindoItem : Boolean;
  peixe : TPeixe;
begin

  qtde := StrToInt(edt_qtde.Text);

  qtde := qtde+1;

  edt_qtde.Text := qtde.ToString;

  inserindoItem := true;

  peixe.cod_peixe := StrToInt(lbl_codigo.Text);
  peixe.nome_peixe := lbl_nome.Text;
  peixe.qtde := qtde;

  //Frm_Pedidos.inserirProdutonoVetor(produto);


end;

end.
