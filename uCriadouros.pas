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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListBox, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TCriadouro = record
    id, capacidade, qtd_peixes, temp : Integer;
    nome, especie, status : string;
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
    SpeedButton7: TSpeedButton;
    ListView1: TListView;
    Label16: TLabel;
    Layout8: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Layout9: TLayout;
    Layout10: TLayout;
    Label17: TLabel;
    Label18: TLabel;
    ListView2: TListView;
    btn_Limpar: TButton;
    btn_colher: TButton;
    btn_remover: TButton;
    TabControl2: TTabControl;
    tbCadCri: TTabItem;
    tbPeixesCri: TTabItem;
    Label10: TLabel;
    Layout7: TLayout;
    Edit1: TEdit;
    SpeedButton6: TSpeedButton;
    ListBox1: TListBox;
    btnCadastrarCri: TButton;
    procedure btn_cadastrarProxClick(Sender: TObject);
    procedure statusAgua(status : string);
    procedure insereCriadourosBanco(criadouro : TCriadouro);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btn_novoCriadouroClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btn_cadastrarCriClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_gerenciarCriClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnCadastrarCriClick(Sender: TObject);

  private
    procedure inserirItemListBox(cod_peixe:integer; nome_peixe:string; qtde:integer);
    procedure atualizarListBox;
    procedure consultarPeixesBanco;
    procedure inserirPeixesnoCriadouro(cod_peixe: integer; nome_peixe: string;
      qtde: integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCriadouros: TfrmCriadouros;

implementation

{$R *.fmx}

uses uPeixesFrame, uServicos;

procedure TfrmCriadouros.btnCadastrarCriClick(Sender: TObject);
begin
  //colocar os dados no banco
end;

procedure TfrmCriadouros.btn_cadastrarCriClick(Sender: TObject);
var vCriadouro : TCriadouro; vPeixe : TPeixe;
begin
  vCriadouro.id := StrToInt(edt_idCriadouro.Text);
  vCriadouro.nome := edt_nomeCri.Text;
  vCriadouro.qtd_peixes := vPeixe.qtde;
  vCriadouro.especie := vPeixe.nome_peixe;
  vCriadouro.dataCriacao := StrToDate(dataCriadouro.Text);

  //Chamar procedimento para inserir no banco
  insereCriadourosBanco(vCriadouro);
  ShowMessage('Criadouro criado com sucesso!');
end;

procedure TfrmCriadouros.btn_cadastrarProxClick(Sender: TObject);
var vCriadouro : TCriadouro;
begin

  TabControl1.TabIndex := 2;

end;

procedure TfrmCriadouros.btn_gerenciarCriClick(Sender: TObject);
begin
  TabControl1.TabIndex := 3;
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
  FDQCriadouros.ParamByName('id').AsInteger := criadouro.id;
  FDQCriadouros.ParamByName('nome').AsString := criadouro.nome;
  FDQCriadouros.ParamByName('capacidade').AsInteger := criadouro.capacidade;
  FDQCriadouros.ParamByName('especie').AsString := criadouro.especie;
  FDQCriadouros.ParamByName('data_criacao').AsDate := criadouro.dataCriacao;

  FDQCriadouros.ExecSQL;

end;

procedure TfrmCriadouros.statusAgua(status: string);
begin
  if Random(2) = 0 then
    status := 'Bom'
  else
    status := 'Ruim';
end;

procedure TfrmCriadouros.inserirItemListBox(cod_peixe:integer; nome_peixe:string; qtde:integer);
var item : TListBoxItem;
    form : TFrmListaPeixes;
begin

  item := TListBoxItem.Create(ListBox1);
  item.Height := 52;
  item.Tag := cod_peixe;

  form := TFrmListaPeixes.Create(item);
  form.Align := TAlignLayout.Client;
  form.lbl_nome.Text := nome_peixe;
  form.lbl_codigo.Text := IntToStr(cod_peixe);

  item.AddObject(form);

  ListBox1.AddObject(item);

end;

procedure TfrmCriadouros.SpeedButton1Click(Sender: TObject);
begin
  frmServicos.Show;

end;

procedure TfrmCriadouros.SpeedButton2Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure TfrmCriadouros.SpeedButton3Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure TfrmCriadouros.SpeedButton4Click(Sender: TObject);
begin
  //mostrar criadouros no listview1

end;

procedure TfrmCriadouros.SpeedButton5Click(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure TfrmCriadouros.SpeedButton6Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
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
    inserirItemListBox( FDQCriadouros.FieldByName('cod_peixe').AsInteger,
                        FDQCriadouros.FieldByName('nome_peixe').AsString,
                        FDQCriadouros.FieldByName('qtde').AsInteger);


    FDQCriadouros.Next;

  end;

end;

procedure TfrmCriadouros.inserirPeixesnoCriadouro(cod_peixe : integer; nome_peixe : string; qtde : integer);
begin

end;



end.
