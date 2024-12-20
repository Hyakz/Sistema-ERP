unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, RxToolEdit, cCadCliente, uEnum,
  ACBrBase, ACBrCEP, ACBrSocket, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Client, REST.Response.Adapter, Data.Bind.Components, Data.Bind.ObjectScope, Math, Datasnap.DBClient,
  System.ImageList, Vcl.ImgList, System.RegularExpressions, ACBrValidador;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    lbledtClienteID: TLabeledEdit;
    medtCEP: TMaskEdit;
    lbl1: TLabel;
    lbledtNome: TLabeledEdit;
    lbledtEndereco: TLabeledEdit;
    lbledtBairro: TLabeledEdit;
    lbledtCidade: TLabeledEdit;
    medtTelefone: TMaskEdit;
    lbl2: TLabel;
    lbledtEmail: TLabeledEdit;
    dtdtDataNascimento: TDateEdit;
    lbl3: TLabel;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTClient1: TRESTClient;
    FDMemTable1: TFDMemTable;
    lkpStatus: TDBLookupComboBox;
    edtEstado: TLabeledEdit;
    lbl4: TLabel;
    dsStatus: TDataSource;
    lkpPessoa: TDBLookupComboBox;
    lbl5: TLabel;
    dsPessoa: TDataSource;
    QryStatus: TZQuery;
    QryPessoa: TZQuery;
    zqryQryListagemclienteID: TIntegerField;
    wdstrngfldQryListagemnome: TWideStringField;
    wdstrngfldQryListagemendereco: TWideStringField;
    wdstrngfldQryListagemcidade: TWideStringField;
    wdstrngfldQryListagembairro: TWideStringField;
    wdstrngfldQryListagemestado: TWideStringField;
    wdstrngfldQryListagemcep: TWideStringField;
    wdstrngfldQryListagemtelefone: TWideStringField;
    wdstrngfldQryListagememail: TWideStringField;
    zqryQryListagempessoaID: TIntegerField;
    zqryQryListagemstatusID: TIntegerField;
    dtmfldQryListagemdataNascimento: TDateTimeField;
    zqryQryStatusstatusID: TIntegerField;
    wdstrngfldQryStatustipoStatus: TWideStringField;
    zqryQryPessoapessoaID: TIntegerField;
    wdstrngfldQryPessoatipoPessoa: TWideStringField;
    edtCNPJ: TLabeledEdit;
    pnl1: TPanel;
    lblAtivo: TLabel;
    lblAtivo1: TLabel;
    lblAtivo2: TLabel;
    lblAtivo3: TLabel;
    lblAtivo4: TLabel;
    imgAtivo: TImage;
    imgInativo: TImage;
    imgBloqueado: TImage;
    imgAtencao: TImage;
    imgProspecto: TImage;
    imgListStatus: TImageList;
    ACBrValidador1: TACBrValidador;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure medtCEPChange(Sender: TObject);
    procedure lkpPessoaClick(Sender: TObject);
    procedure edtCNPJChange(Sender: TObject);
    procedure medtTelefoneChange(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
       State: TGridDrawState);
    procedure lbledtEmailExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);

  private
    oCliente: TCliente;

  public
    { Public declarations }
    function Apagar: Boolean; override;
    function Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean; override;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uDTMConexao;

{$R *.dfm}

// functions

function SomenteNumeros(const Valor: string): string;
var
  i: Integer;
  Ch: Char;
begin
  Result := '';
  for i  := 1 to Length(Valor) do
  begin
    Ch := Valor[i];
    if Ch in ['0'..'9'] then
       Result := Result + Ch;
  end;
end;

function ValidarEmail(const Email: string): Boolean;
const
  PadraoEmail = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
begin
  Result := TRegEx.IsMatch(Email, PadraoEmail);
end;

function TfrmCadCliente.Apagar: Boolean;
begin
  if MessageDlg(
     'Tem certeza que deseja excluir?' + sLineBreak +
     'Isso apagar� todos os registros relacionados a ele, incluindo as vendas.',
     mtConfirmation,[mbYes, mbNo], 0) = mrYes
  then
  begin
    if oCliente.Selecionar(QryListagem.FieldByName('clienteID').AsInteger) then
    begin
      Result := oCliente.Apagar;
    end
    else
      Result := False;
  end
  else
    Result := False;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  try
    if lbledtClienteID.Text <> EmptyStr then

      oCliente.codigo := StrToInt(lbledtClienteID.Text)
    else
      oCliente.codigo := 0;

    oCliente.nome           := lbledtNome.Text;
    oCliente.cep            := medtCEP.Text;
    oCliente.endereco       := lbledtEndereco.Text;
    oCliente.bairro         := lbledtBairro.Text;
    oCliente.cidade         := lbledtCidade.Text;
    oCliente.estado         := edtEstado.Text;
    oCliente.telefone       := medtTelefone.Text;
    oCliente.email          := lbledtEmail.Text;
    oCliente.dataNascimento := dtdtDataNascimento.Date;
    oCliente.cpfcnpj        := edtCNPJ.Text;

    oCliente.Status := lkpStatus.KeyValue;
    oCliente.Pessoa := lkpPessoa.KeyValue;

    if EstadoDoCadastro = ecInserir then
       Result := oCliente.Inserir
    else if EstadoDoCadastro = ecAlterar then
       Result := oCliente.Atualizar;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao gravar dados: ' + E.Message);
    end;
  end;
end;

function ValidarCPF(const CPF: string): Boolean;
var
  i, j, Soma, Digito1, Digito2: Integer;
  Digitos: string;
begin
  Digitos := SomenteNumeros(CPF);

  if Length(Digitos) <> 11 then
    Exit(False);

  if (Digitos[1] = Digitos[2]) and (Digitos[1] = Digitos[3]) and
     (Digitos[1] = Digitos[4]) and (Digitos[1] = Digitos[5]) and
     (Digitos[1] = Digitos[6]) and (Digitos[1] = Digitos[7]) and
     (Digitos[1] = Digitos[8]) and (Digitos[1] = Digitos[9]) and
     (Digitos[1] = Digitos[10])and (Digitos[1] = Digitos[11])
  then
    Exit(False);

  Soma  := 0;
  for i := 1 to 9 do
      Soma    := Soma + (StrToInt(Digitos[i]) * (11 - i));
      Digito1 := (Soma * 10) mod 11;

   if Digito1 = 10 then Digito1 := 0;

  Soma  := 0;
  for i := 1 to 10 do
      Soma    := Soma + (StrToInt(Digitos[i]) * (12 - i));
      Digito2 := (Soma * 10) mod 11;
   if Digito2 = 10 then Digito2 := 0;

  Result := (Digitos[10] = IntToStr(Digito1)) and (Digitos[11] = IntToStr(Digito2));
end;

function ValidarCNPJ(const CNPJ: string): Boolean;
var
  i, Soma, Digito1, Digito2: Integer;
  Digitos: string;
begin
  Digitos := SomenteNumeros(CNPJ);

  if Length(Digitos) <> 14 then
    Exit(False);

  Soma  := 0;
  for i := 1 to 12 do
    Soma    := Soma + (StrToInt(Digitos[i]) * (5 - (i mod 8)));
    Digito1 := (Soma mod 11);

  if Digito1 < 2 then
     Digito1 := 0
  else
    Digito1 := 11 - Digito1;

  Soma  := 0;
  for i := 1 to 13 do
     Soma    := Soma + (StrToInt(Digitos[i]) * (6 - (i mod 8)));
     Digito2 := (Soma mod 11);

  if Digito2 < 2 then
     Digito2 := 0
  else
    Digito2 := 11 - Digito2;

  Result := (Digitos[13] = IntToStr(Digito1)) and (Digitos[14] = IntToStr(Digito2));
end;

// Status

procedure TfrmCadCliente.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
   State: TGridDrawState);
var
  Index : Integer;
begin
  inherited;

  if Column.FieldName = 'statusID' then
  begin
    grdListagem.Canvas.FillRect(Rect);

    if Column.Field.AsInteger = 1 then
       index := 0
    else

    if Column.Field.AsInteger = 2 then
       index := 1
    else

    if Column.Field.AsInteger = 3 then
       index := 2
    else

    if Column.Field.AsInteger = 4 then
       index := 3
    else

    if Column.Field.AsInteger = 5 then
       index := 4;

    imgListStatus.Draw(grdListagem.Canvas, Rect.Left + 12, Rect.Top + 1, index);
  end;
end;

// Forms

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCliente.Create(dtmPrincipal.ConexaoDB);
  IndiceAtual := 'nome';
  QryStatus.open;
  QryPessoa.open;

  edtCNPJ.Enabled:=False;
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
     FreeAndNil(oCliente);
     QryStatus.close;
     QryPessoa.Close;
end;

// CEP

procedure TfrmCadCliente.medtCEPChange(Sender: TObject);
var
  CEP: string;
  CaretPos: Integer;
  OldTextLength, NewTextLength: Integer;
begin
  CEP := SomenteNumeros(medtCEP.Text);

  //Mascara do CEP
  CaretPos := medtCEP.SelStart;
  OldTextLength := Length(medtCEP.Text);

  if Length(CEP) > 5 then
    CEP := Copy(CEP, 1, 5) + '-' + Copy(CEP, 6, Length(CEP) - 5);

  medtCEP.Text := CEP;

  NewTextLength := Length(medtCEP.Text);
  CaretPos := CaretPos + (NewTextLength - OldTextLength);

  medtCEP.SelStart := Length(medtCEP.Text);

  //CEP
  if Length(SomenteNumeros(CEP)) = 8 then
  begin
    RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + SomenteNumeros(CEP) + '/json/';
    try
      RESTRequest1.ExecuteAsync(
        procedure
        begin
          if RESTResponse1.StatusCode = 200 then
          begin
            lbledtBairro.Text   := RESTResponse1.JSONValue.GetValue<string>('bairro');
            lbledtEndereco.Text := RESTResponse1.JSONValue.GetValue<string>('logradouro');
            lbledtCidade.Text   := RESTResponse1.JSONValue.GetValue<string>('localidade');
            edtEstado.Text      := RESTResponse1.JSONValue.GetValue<string>('uf');
          end

          else
          begin
            lbledtBairro.Text   := '';
            lbledtEndereco.Text := '';
            lbledtCidade.Text   := '';
            edtEstado.Text      := '';
          end;
        end
      );

    except
      on E: Exception do
      begin
        lbledtBairro.Text   := '';
        lbledtEndereco.Text := '';
        lbledtCidade.Text   := '';
        edtEstado.Text      := '';
        ShowMessage('Erro ao consultar o CEP: ' + E.Message);
      end;
    end;
  end

  else
  begin
    lbledtBairro.Text   := '';
    lbledtEndereco.Text := '';
    lbledtCidade.Text   := '';
    edtEstado.Text      := '';
  end;
end;

// TELEFONE MASCARA

procedure TfrmCadCliente.medtTelefoneChange(Sender: TObject);
var
  TextoLimpo, TextoFormatado: string;
begin
  TextoLimpo     := SomenteNumeros(medtTelefone.Text);
  TextoFormatado := '';

  if (Length(TextoLimpo) >= 4) and (Copy(TextoLimpo, 1, 1) = '0') and
     (Copy(TextoLimpo, 3, 2) = '00')
  then
  begin
    medtTelefone.MaxLength := 13;
    case Length(TextoLimpo) of
      1..4: TextoFormatado  := Copy(TextoLimpo, 1, 4);
      5..7: TextoFormatado  := Copy(TextoLimpo, 1, 4) + ' ' + Copy(TextoLimpo, 5, 3);
      8..11: TextoFormatado := Copy(TextoLimpo, 1, 4) + ' ' + Copy(TextoLimpo, 5, 3) + ' ' + Copy(TextoLimpo, 8, 4);
    end;
  end

  else if Length(TextoLimpo) <= 11 then
  begin
    medtTelefone.MaxLength  := 15;
    case Length(TextoLimpo) of
      1..2: TextoFormatado  := '(' + Copy(TextoLimpo, 1, 2) + ') ';
      3..6: TextoFormatado  := '(' + Copy(TextoLimpo, 1, 2) + ') ' + Copy(TextoLimpo, 3, 4);
      7..10: TextoFormatado := '(' + Copy(TextoLimpo, 1, 2) + ') ' + Copy(TextoLimpo, 3, 4) + '-' + Copy(TextoLimpo, 7, 4);
      11: TextoFormatado    := '(' + Copy(TextoLimpo, 1, 2) + ') ' + Copy(TextoLimpo, 3, 5) + '-' + Copy(TextoLimpo, 8, 4);
    end;
  end;

  medtTelefone.OnChange := nil;
  medtTelefone.Text     := TextoFormatado;
  medtTelefone.SelStart := Length(TextoFormatado);
  medtTelefone.OnChange := medtTelefoneChange;
end;

//

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if oCliente.Selecionar(QryListagem.FieldByName('clienteID').AsInteger) then
  begin
    lbledtClienteID.Text    := IntToStr(oCliente.codigo);
    lbledtNome.Text         := oCliente.nome;
    medtCEP.Text            := oCliente.cep;
    lbledtEndereco.Text     := oCliente.endereco;
    lbledtBairro.Text       := oCliente.bairro;
    lbledtCidade.Text       := oCliente.cidade;
    edtEstado.Text          := oCliente.estado;
    medtTelefone.Text       := oCliente.telefone;
    lbledtEmail.Text        := oCliente.email;
    dtdtDataNascimento.Date := oCliente.dataNascimento;
    edtCNPJ.Text            := oCliente.cpfcnpj;

    lkpPessoa.keyValue      := oCliente.Pessoa;
    lkpStatus.keyValue      := oCliente.status;
  end

  else
  begin
    btnCancelar.Click;
    Abort;
  end;
end;

procedure TfrmCadCliente.lbledtEmailExit(Sender: TObject);
var
  Email : string;
begin
  Email := lbledtEmail.Text;

  if Email = '' then
     Exit;

  if not ValidarEmail(Email) then
  begin
    ShowMessage('E-mail inv�lido. Por favor, insira um e-mail v�lido');
    lbledtEmail.SetFocus;
  end;
end;

procedure TfrmCadCliente.lkpPessoaClick(Sender: TObject);
begin
  if lkpPessoa.Text = 'Fisica' then
  begin
    edtCNPJ.EditLabel.Caption := 'CPF';
    edtCNPJ.Enabled := True;
    edtCNPJ.Clear;
  end

  else
  if lkpPessoa.Text = 'Juridica' then
  begin
     edtCNPJ.EditLabel.Caption := 'CNPJ';
     edtCNPJ.Enabled := True;
     edtCNPJ.Clear;
  end;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  dtdtDataNascimento.Date := Date;
  lbledtNome.SetFocus;
end;

// CPF - CNPJ

procedure TfrmCadCliente.edtCNPJChange(Sender: TObject);
var
  TextoLimpo, TextoFormatado: string;
  CPFValido, CNPJValido: Boolean;
begin
  TextoLimpo := SomenteNumeros(edtCNPJ.Text);

  if lkpPessoa.Text = 'Fisica' then
  begin
    edtCNPJ.MaxLength := 14;

    case Length(TextoLimpo) of
      1..3: TextoFormatado  := Copy(TextoLimpo, 1, 3);
      4..5: TextoFormatado  := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3);
      6..8: TextoFormatado  := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3) + '.' + Copy(TextoLimpo, 7, 3);
      9..11: TextoFormatado := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3) + '.' + Copy(TextoLimpo, 7, 3) + '-' + Copy(TextoLimpo, 10, 2);
    else
      TextoFormatado := Copy(TextoLimpo, 1, 14);
    end;

    edtCNPJ.OnChange := nil;
    edtCNPJ.Text     := TextoFormatado;
    edtCNPJ.SelStart := Length(TextoFormatado);
    edtCNPJ.OnChange := edtCNPJChange;

    if Length(TextoLimpo) = 11 then
    begin
      CPFValido := ValidarCPF(TextoLimpo);
      if not CPFValido then
         ShowMessage('CPF inv�lido.');
    end;
  end

  else if lkpPessoa.Text = 'Juridica' then
  begin
    edtCNPJ.MaxLength := 18;
    case Length(TextoLimpo) of
      1..2: TextoFormatado   := Copy(TextoLimpo, 1, 2);
      3..5: TextoFormatado   := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3);
      6..8: TextoFormatado   := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3);
      9..12: TextoFormatado  := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3) + '/' + Copy(TextoLimpo, 9, 4);
      13..14: TextoFormatado := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3) + '/' + Copy(TextoLimpo, 9, 4) + '-' + Copy(TextoLimpo, 13, 2);
    else
      TextoFormatado := Copy(TextoLimpo, 1, 18);
    end;

    edtCNPJ.OnChange := nil;
    edtCNPJ.Text     := TextoFormatado;
    edtCNPJ.SelStart := Length(TextoFormatado);
    edtCNPJ.OnChange := edtCNPJChange;
  end;
end;

procedure TfrmCadCliente.edtCNPJExit(Sender: TObject);
var
  CNPJ: String;
  IsValid: Boolean;
begin
  CNPJ := edtCNPJ.Text;

  ACBrValidador1.Documento := CNPJ;
  ACBrValidador1.TipoDocto := docCNPJ;

  IsValid := ACBrValidador1.Validar;

  if Not IsValid then
     ShowMessage('CNPJ inv�lido.');
end;


end.
