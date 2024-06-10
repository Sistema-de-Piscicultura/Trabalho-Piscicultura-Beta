unit uCriadouros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListBox;

type
  TCriadouro = record
    id, capacidade, qtd_peixes : Integer;
    nome, especie : string;
    dataCriacao : TDate;
  end;

  TPeixe = record
    cod_peixe, qtde  : Integer;
    nome_peixe : string;
  end;

type
  TfrmCriadouros = class(TForm)
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
    dataCriadouro: TDateEdit;
    Label8: TLabel;
    btn_cadastrarProx: TButton;
    TabItem3: TTabItem;
    Layout4: TLayout;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    Layout5: TLayout;
    edt_pesquisarCri: TEdit;
    SpeedButton4: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQCriadouros: TFDQuery;
    TabItem4: TTabItem;
    Layout6: TLayout;
    Label7: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Layout7: TLayout;
    Edit1: TEdit;
    SpeedButton7: TSpeedButton;
    ListBox1: TListBox;
    btn_cadastrarCri: TButton;
    Label10: TLabel;
    procedure btn_cadastrarProxClick(Sender: TObject);
    procedure statusAgua(status : string);
    procedure insereCriadourosBanco(criadouro : TCriadouro);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btn_novoCriadouroClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btn_cadastrarCriClick(Sender: TObject);

  private
    procedure inserirItemListBox(nome_peixe:string; qtde, cod_peixe:integer);
    procedure atualizarListBox;
    procedure consultarPeixesBanco;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriadouros: TfrmCriadouros;

implementation

{$R *.fmx}

uses uPeixesFrame;

procedure TfrmCriadouros.btn_cadastrarCriClick(Sender: TObject);
var vCriadouro : TCriadouro; vPeixe : TPeixe;
begin
  vCriadouro.id := StrToInt(edt_idCriadouro.Text);
  vCriadouro.nome := edt_nomeCri.Text;
  vCriadouro.qtd_peixes := vPeixe.qtde;
  vCriadouro.especie := vPeixe.nome_peixe;
  vCriadouro.dataCriacao := StrToDate(dataCriadouro.Text);

  //Chamar procedimento para inserir o cliente no banco
  insereCriadourosBanco(vCriadouro);
end;

procedure TfrmCriadouros.btn_cadastrarProxClick(Sender: TObject);
var vCriadouro : TCriadouro;
begin

  TabControl1.TabIndex := 2;

end;

procedure TfrmCriadouros.btn_novoCriadouroClick(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure TfrmCriadouros.insereCriadourosBanco(criadouro : TCriadouro);
begin

  FDQCriadouros.Close;
  FDQCriadouros.SQL.Clear;
  FDQCriadouros.SQL.Add('INSERT INTO CRIADOUROS (ID, NOME, CAPACIDADE, ESPECIE, DATA_CRIACAO)');
  FDQCriadouros.SQL.Add(' VALUES (:ID, :NOME, :CAPACIDADE, :ESPECIE, :DATA_CRIACAO)');
  FDQCriadouros.ParamByName('codigo').AsInteger := criadouro.id;
  FDQCriadouros.ParamByName('nome').AsString := criadouro.nome;
  FDQCriadouros.ParamByName('capacidade').AsInteger := criadouro.capacidade;
  FDQCriadouros.ParamByName('especie').AsString := criadouro.especie;
  FDQCriadouros.ParamByName('data_criacao').AsDate := criadouro.dataCriacao;


end;

procedure TfrmCriadouros.statusAgua(status: string);
begin
  if Random(2) = 0 then
    status := 'Bom'
  else
    status := 'Ruim';
end;

procedure TfrmCriadouros.inserirItemListBox(nome_peixe:string; qtde, cod_peixe:integer);
var item : TListBoxItem;
    form : TFrmListaPeixes;
begin

  item := TListBoxItem.Create(ListBox1);
  item.Height := 41;
  item.Tag := cod_peixe;

  form := TFrmListaPeixes.Create(item);
  form.Align := TAlignLayout.Client;
  form.lbl_nome.Text := nome_peixe;
  form.lbl_codigo.Text := IntToStr(cod_peixe);

  item.AddObject(form);

  ListBox1.AddObject(item);

end;

procedure TfrmCriadouros.SpeedButton5Click(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure TfrmCriadouros.SpeedButton6Click(Sender: TObject);
begin
  atualizarListBox();
end;

procedure TfrmCriadouros.consultarPeixesBanco();
begin

  FDQCriadouros.Close;
  FDQCriadouros.SQL.Clear;
  FDQCriadouros.SQL.Add('select * from peixes');
  FDQCriadouros.Open();

end;

procedure TfrmCriadouros.atualizarListBox();
begin

  // montar a consulta no banco
  consultarPeixesBanco();

  while not FDQCriadouros.Eof do
  begin
    inserirItemListBox( FDQCriadouros.FieldByName('nome_peixe').AsString,
                        FDQCriadouros.FieldByName('cod_peixe').AsInteger,
                        FDQCriadouros.FieldByName('qtde').AsInteger);


    FDQCriadouros.Next;
  end;



end;

end.
