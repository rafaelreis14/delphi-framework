unit Principal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
    Vcl.StdCtrls, Data.Win.ADODB, Generics.Collections, RGrid, FileCtrl,
    Vcl.ComCtrls, RComboBox, clsDetalhe, Lib.Lista;

type
    TfrmGeradorClasse = class(TForm)
        ConexaoPrincipal: TADOConnection;
        sqlTableInfo: TADOQuery;
        edTabela: TEdit;
        btnAbrirTabela: TButton;
        Label2: TLabel;
        sqlTableInfocolumn_name: TWideStringField;
        sqlTableInfodata_type: TWideStringField;
        sqlTableInfoproperty: TVariantField;
        RGrid1: TRGrid;
        btnVisualizar: TButton;
        btnGerarClasse: TButton;
        sqlTableInfocharacter_maximum_length: TIntegerField;
        pgcComponentes: TPageControl;
        tbPrincipal: TTabSheet;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        mmClasse: TMemo;
        mmConsultaPAS: TMemo;
        mmConsultaDFM: TMemo;
        GroupBox1: TGroupBox;
        Label3: TLabel;
        edDiretorio: TEdit;
        btnDiretorio: TButton;
        GroupBox2: TGroupBox;
        Label8: TLabel;
        edDiretorioVisoes: TEdit;
        btnVisoes: TButton;
        ckConsulta: TCheckBox;
        ckCadastro: TCheckBox;
        mmCadastroPAS: TMemo;
        mmCadastroDFM: TMemo;
        Label7: TLabel;
        edAlias: TEdit;
        Label9: TLabel;
        edNomeCampo: TEdit;
        btnPesquisar: TButton;
        GroupBox3: TGroupBox;
        Label4: TLabel;
        Button1: TButton;
        ckAdicionaMenu: TCheckBox;
        edPrincipal: TEdit;
        Label6: TLabel;
        Label5: TLabel;
        cbModulo: TRComboBox;
        ADOQuery1: TADOQuery;
        WideStringField1: TWideStringField;
        WideStringField2: TWideStringField;
        IntegerField1: TIntegerField;
        VariantField1: TVariantField;
        Label1: TLabel;
        edClasse: TEdit;
        GroupBox4: TGroupBox;
        CheckBox1: TCheckBox;
    btnAdicionar: TButton;
    btnDeletar: TButton;
    rgDetalhes: TRGrid;
        procedure btnAbrirTabelaClick(Sender: TObject);
        procedure btnVisualizarClick(Sender: TObject);
        procedure btnGerarClasseClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnDiretorioClick(Sender: TObject);
        procedure btnVisoesClick(Sender: TObject);
        procedure edTabelaExit(Sender: TObject);
        procedure btnPesquisarClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure btnAdicionarClick(Sender: TObject);
        procedure ckAdicionaMenuClick(Sender: TObject);
        procedure ckConsultaClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    private
        arquivoBase: TextFile;
        novoArquivo: TextFile;
        arquivoPrincipal: TstringList;
        procedure PopularCampos;
        function ObterCampos(parametro: boolean): string; overload;
        function ObterCampos: string; overload;
        function IfTernario(condicao: boolean; verdadeiro, falso: variant): variant;

        procedure GeraVisualizacao(nomeArquivo, nomeClasse: string; memo: TMemo);
        function obterTipoMascara(tipoSQL: string): string;


    public
        Detalhes: TLista<TDetalhe>;


        function ExecutaMetodos(linha: string; numeroLinha: integer = 0): boolean;
        function obterTipoPopropriedade(tipoSQL: string): string;
        procedure CRIAR_INDICES_FILTRO;
        procedure CRIAR_CAMPOS_FILTRO;
        procedure CRIAR_PROPRIEDADES;
        procedure CRIAR_PRENCHER_OBJETO;
        procedure CRIAR_COMPONENTES_DFM;
        procedure CRIAR_COMPONENTES_PAS;
        procedure CRIAR_GRID_CONSULTA;
        procedure CRIAR_CONSULTA;

        procedure CRIAR_USES_DETALHES(linha: string);

        procedure CRIAR_GETSET_ASSINATURA;
        procedure CRIAR_GETSET_CORPO;

        procedure CRIAR_USES(linha: string; numeroLinha: integer);
        procedure CRIAR_METODO(linha: string; numeroLinha: integer);
        procedure CRIAR_CORPO_METODO(linha: string; numeroLinha: integer);
    end;
var
    frmGeradorClasse: TfrmGeradorClasse;

implementation

{$R *.dfm}

uses ClsCampo, System.Generics.Collections, CadDetalhe;

procedure TfrmGeradorClasse.btnAbrirTabelaClick(Sender: TObject);
begin
    sqlTableInfo.Close;
    sqlTableInfo.Parameters.ParamByName('Table').Value := edTabela.Text;
    sqlTableInfo.Open;
    PopularCampos;
end;

procedure TfrmGeradorClasse.btnVisoesClick(Sender: TObject);
var
    path: string;
begin
    path := 'C:\\'; { Diretorio inicio... }
    if SelectDirectory(path, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
        edDiretorioVisoes.Text := path;
end;

procedure TfrmGeradorClasse.btnVisualizarClick(Sender: TObject);
begin
    if edClasse.Text = EmptyStr then
    begin
        ShowMessage('� preciso preencher o nome da classe');
        exit;
    end;

    mmClasse.Clear;
    mmConsultaPAS.Clear;
    mmConsultaDFM.Clear;
    mmCadastroPAS.Clear;
    mmCadastroDFM.Clear;

    if trim(edDiretorioVisoes.Text) <> EmptyStr then
    begin
        if ckConsulta.Checked then
        begin
            GeraVisualizacao('ConsultaBase.pas', 'ClasseBase', mmConsultaPAS);
            GeraVisualizacao('ConsultaBase.dfm', 'ClasseBase', mmConsultaDFM);
            btnGerarClasse.Enabled := true;
        end;

        if ckCadastro.Checked then
        begin
            GeraVisualizacao('CadastroBase.pas', 'ClasseBase', mmCadastroPAS);
            GeraVisualizacao('CadastroBase.dfm', 'ClasseBase', mmCadastroDFM);
            btnGerarClasse.Enabled := true;
        end;
    end;

    if trim(edDiretorio.Text) <> EmptyStr then
    begin
        GeraVisualizacao('ClasseBase.pas', 'ClsBase', mmClasse);
        btnGerarClasse.Enabled := true;
    end;

end;

procedure TfrmGeradorClasse.Button1Click(Sender: TObject);
var
    path: string;
begin
    path := 'C:\\'; { Diretorio inicio... }
    if SelectDirectory(path, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
        edPrincipal.Text := path;

end;

procedure TfrmGeradorClasse.CheckBox1Click(Sender: TObject);
begin
    btnAdicionar.Enabled := not btnAdicionar.Enabled;
    btnDeletar.Enabled := not btnDeletar.Enabled;
    rgDetalhes.Enabled := not rgDetalhes.Enabled;
end;

procedure TfrmGeradorClasse.btnAdicionarClick(Sender: TObject);
var
    det: TDetalhe;
begin
    frmCadastroDetalhe := tfrmCadastroDetalhe.Create(Self);
    det:= TDetalhe.Create;
    frmCadastroDetalhe.Detalhe := det;
    frmCadastroDetalhe.ShowModal;
    if det <> nil then
    begin
        Detalhes.Add(det);
        rgDetalhes.DataSource := detalhes.ToList;
        rgDetalhes.DataBind;
    end;
end;

procedure TfrmGeradorClasse.btnDeletarClick(Sender: TObject);
begin
   Detalhes.Delete(rgDetalhes.GetObject<TDetalhe>);
   rgDetalhes.DataSource := Detalhes.ToList;
   rgDetalhes.DataBind;
end;

procedure TfrmGeradorClasse.ckAdicionaMenuClick(Sender: TObject);
begin
   Label4.Enabled := not Label4.Enabled;
   cbModulo.Enabled := not cbModulo.Enabled;
   Label5.Enabled := not Label5.Enabled;
   edPrincipal.Enabled := not edPrincipal.Enabled;
   Button1.Enabled := not Button1.Enabled;
   Label6.Enabled := not Label6.Enabled;


end;

procedure TfrmGeradorClasse.ckConsultaClick(Sender: TObject);
begin
    if (ckConsulta.Checked = false) and (ckCadastro.Checked = false) then
    begin
        Label8.Enabled := false;
        edDiretorioVisoes.Enabled := false;
        btnVisoes.Enabled := false;
    end
    else
    begin
        Label8.Enabled := true;
        edDiretorioVisoes.Enabled := true;
        btnVisoes.Enabled := true;
    end;

end;

procedure TfrmGeradorClasse.btnDiretorioClick(Sender: TObject);
var
    path: string;
begin
    path := 'C:\\'; { Diretorio inicio... }
    if SelectDirectory(path, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
        edDiretorio.Text := path;
end;

procedure TfrmGeradorClasse.btnGerarClasseClick(Sender: TObject);
var
    I: integer;
    diretorio: string;
    linha: string;
    sql: string;
    ok: boolean;
begin
    ok := false;
    try
        if (trim(edDiretorio.Text) <> EmptyStr) and (ckConsulta.Enabled or ckCadastro.Enabled)then
        begin
            diretorio := edDiretorio.Text;
            AssignFile(novoArquivo, diretorio + '\Biz.' + edClasse.Text + '.pas');
            Rewrite(novoArquivo);

            for I := 0 to mmClasse.Lines.Count - 1 do
                Writeln(novoArquivo, mmClasse.Lines[I]);

            CloseFile(novoArquivo);
            ok := true;

        end;

        if trim(edDiretorioVisoes.Text) <> EmptyStr then
        begin
            if ckConsulta.Checked then
            begin
                diretorio := edDiretorioVisoes.Text;
                AssignFile(novoArquivo, diretorio + '\UI.' + edClasse.Text + '.Consulta.pas');
                Rewrite(novoArquivo);

                for I := 0 to mmConsultaPAS.Lines.Count - 1 do
                    Writeln(novoArquivo, mmConsultaPAS.Lines[I]);

                CloseFile(novoArquivo);

                diretorio := edDiretorioVisoes.Text;
                AssignFile(novoArquivo, diretorio + '\UI.' + edClasse.Text + '.Consulta.dfm');
                Rewrite(novoArquivo);

                for I := 0 to mmConsultaDFM.Lines.Count - 1 do
                    Writeln(novoArquivo, mmConsultaDFM.Lines[I]);

                CloseFile(novoArquivo);
                ok := true;
            end;

            if ckCadastro.Checked then
            begin
                diretorio := edDiretorioVisoes.Text;
                AssignFile(novoArquivo, diretorio + '\UI.' + edClasse.Text + '.Cadastro.pas');
                Rewrite(novoArquivo);

                for I := 0 to mmCadastroPAS.Lines.Count - 1 do
                    Writeln(novoArquivo, mmCadastroPAS.Lines[I]);

                CloseFile(novoArquivo);

                diretorio := edDiretorioVisoes.Text;
                AssignFile(novoArquivo, diretorio + '\UI.' + edClasse.Text + '.Cadastro.dfm');
                Rewrite(novoArquivo);

                for I := 0 to mmCadastroDFM.Lines.Count - 1 do
                    Writeln(novoArquivo, mmCadastroDFM.Lines[I]);

                CloseFile(novoArquivo);
                ok := true;
            end;

        end;

        if (ckAdicionaMenu.Checked) and (edPrincipal.Text <> EmptyStr) then
        begin
            if MessageDlg('Deseja realmente alterar o form principal?', mtwarning, [mbYes, mbNo], 0) = mrYes then
            begin
                arquivoPrincipal := TstringList.Create;

                arquivoPrincipal.LoadFromFile(edPrincipal.Text + '\UI.Sistema.Principal.pas');

                for I := 0 to arquivoPrincipal.Count - 1 do
                    ExecutaMetodos(arquivoPrincipal[I], I);

                arquivoPrincipal.SaveToFile(edPrincipal.Text + '\UI.Sistema.Principal.pas');

//                sql := 'INSERT INTO SIATD_S05_01 VALUES  (''FRMCON'+UpperCase(edClasse.Text)+''', ''CADASTRO'', ''Cadastro'+edClasse.Text+''', ''Cadastro de '+edClasse.Text+''', 0 , '''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S09_01 VALUES (''FRMCON'+UpperCase(edClasse.Text)+''', '''+cbModulo.Value+''', '''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S20_01 VALUES (''ADMINISTRADORES'', '''+cbModulo.Value+''', ''DESKTOP'',''FRMCON'+UpperCase(edClasse.Text)+''', '''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S24_01 VALUES (''ADMINISTRADORES'', '''+cbModulo.Value+''', ''DESKTOP'',''FRMCON'+UpperCase(edClasse.Text)+''', ''INCLUIR'','''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S24_01 VALUES (''ADMINISTRADORES'', '''+cbModulo.Value+''', ''DESKTOP'',''FRMCON'+UpperCase(edClasse.Text)+''', ''ALTERAR'','''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S24_01 VALUES (''ADMINISTRADORES'', '''+cbModulo.Value+''', ''DESKTOP'',''FRMCON'+UpperCase(edClasse.Text)+''', ''EXCLUIR'','''' )' ;
//                sql := sql + ' INSERT INTO SIATD_S24_01 VALUES (''ADMINISTRADORES'', '''+cbModulo.Value+''', ''DESKTOP'',''FRMCON'+UpperCase(edClasse.Text)+''', ''VISUALIZAR'','''' )' ;
//                ADOQuery1.Close;
//                ADOQuery1.SQL.Clear;
//                ADOQuery1.SQL.Add(sql);
//                ADOQuery1.ExecSQL;

                ok := true;
            end;

        end;
        if ok then
            ShowMessage('Arquivo(s) gerado(s)/alterado(s) com sucesso')
        else
            ShowMessage('Nenhum processo executado, verifique campos obrigat�rios.');
    except
        ShowMessage('Erro ao gerar arquivo(s)');
    end;
end;

procedure TfrmGeradorClasse.CRIAR_CONSULTA;
var
    list: Tlist;
    I: integer;
    campo: Tcampo;
begin
    try
        list := RGrid1.GetSelectedItems;

        for I := 0 to list.Count - 1 do
        begin
            campo := Tcampo(list[I]);
            mmClasse.Lines.Add('        condicao.Adiciona(' + QuotedStr(campo.NomeColuna) + ',ccIgual, ' + IfTernario(I = 0, 'lgAnd); ', 'lgAND); '));
        end;
    finally

    end;
end;

procedure TfrmGeradorClasse.btnPesquisarClick(Sender: TObject);
var
    I: integer;
begin
    if (not RGrid1.IsEmpty) and (edNomeCampo.Text <> EmptyStr) then
    begin
        for I := 0 to RGrid1.DataSource.Count - 1 do
        begin
            if Tcampo(RGrid1.DataSource[I]).NomeColuna = edNomeCampo.Text then
            begin
                RGrid1.Row := I + 1;
                break;
            end;
        end;
    end;
end;

procedure TfrmGeradorClasse.PopularCampos;
var
    campo: Tcampo;
    lista: Tlist;
begin
    lista := Tlist.Create;
    while not sqlTableInfo.Eof do
    begin
        campo := Tcampo.Create;
        campo.NomeColuna := sqlTableInfocolumn_name.AsString;
        campo.TipoPropriedade := obterTipoPopropriedade(sqlTableInfodata_type.AsString);
        campo.Tamanho := sqlTableInfocharacter_maximum_length.AsInteger;
        campo.NomePropriedade := EmptyStr;
        lista.Add(campo);
        sqlTableInfo.Next;
    end;

    RGrid1.DataSource := lista;
    RGrid1.DataBind;
end;

function TfrmGeradorClasse.ExecutaMetodos(linha: string; numeroLinha: integer): boolean;
begin
    result := false;
    if Pos('[CRIAR_PROPRIEDADES]', linha) > 0 then
    begin
        CRIAR_PROPRIEDADES;
        result := true;
    end
    else if Pos('[CRIAR_CAMPOS_FILTRO]', linha) > 0 then
    begin
        CRIAR_CAMPOS_FILTRO;
        result := true;
    end
    else if Pos('[CRIAR_PRENCHER_OBJETO]', linha) > 0 then
    begin
        CRIAR_PRENCHER_OBJETO;
        result := true;
    end;

    if Pos('[CRIAR_COMPONENTES_DFM]', linha) > 0 then
    begin
        CRIAR_COMPONENTES_DFM;
        result := true;
    end;

    if Pos('[CRIAR_COMPONENTES_PAS]', linha) > 0 then
    begin
        CRIAR_COMPONENTES_PAS;
        result := true;
    end;

    if Pos('[CRIAR_GRID_CONSULTA]', linha) > 0 then
    begin
        CRIAR_GRID_CONSULTA;
        result := true;
    end;

    if Pos('[CRIAR_CONSULTA]', linha) > 0 then
    begin
        CRIAR_CONSULTA;
        result := true;
    end;

    if Pos('[CRIAR_INDICES_FILTRO]', linha) > 0 then
    begin
        CRIAR_INDICES_FILTRO;
        result := true;
    end;

   if Pos('[CRIAR_GETSET_ASSINATURA]', linha) > 0 then
    begin
        CRIAR_GETSET_ASSINATURA;
        result := true;
    end;


    if Pos('[CRIAR_GETSET_CORPO]', linha) > 0 then
    begin
        CRIAR_GETSET_CORPO;
        result := true;
    end;

    if Pos('[CRIAR_USES_DETALHES]', linha) > 0 then
    begin
        CRIAR_USES_DETALHES(linha);
        result := true;
    end;

    if Pos('{GERAR_METODO', linha) > 0 then
    begin
        CRIAR_METODO(linha, numeroLinha);
        result := true;
    end;

    if Pos('{GERAR_USES}', linha) > 0 then
    begin
        CRIAR_USES(linha, numeroLinha);
        result := true;
    end;

    if Pos('{GERAR_CORPO_METODO}', linha) > 0 then
    begin
        CRIAR_CORPO_METODO(linha, numeroLinha);
        result := true;
    end;
end;

procedure TfrmGeradorClasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Detalhes);
end;

procedure TfrmGeradorClasse.FormCreate(Sender: TObject);
begin
  Detalhes := TLista<TDetalhe>.create;
end;

procedure TfrmGeradorClasse.FormShow(Sender: TObject);
begin
    RGrid1.AddCol('NomeColuna');
    RGrid1.AddCol('TipoPropriedade');
    RGrid1.AddCol('Tamanho', 30);
    RGrid1.AddCol('NomePropriedade', 100, true);

    rgDetalhes.AddCol('NomeClasse');
    rgDetalhes.AddCol('PropriedadeID');
    rgDetalhes.AddCol('PropriedadeDescricao');

    cbModulo.DataBind;
end;

procedure TfrmGeradorClasse.GeraVisualizacao(nomeArquivo, nomeClasse: string; memo: TMemo);
var
    diretorio: string;
    linha: string;
begin
    memo.Lines.Clear;
    diretorio := ExtractFilePath(Application.Exename);

    AssignFile(arquivoBase, diretorio + '\' + nomeArquivo);
    Reset(arquivoBase);
    while not Eof(arquivoBase) do
    begin
        Readln(arquivoBase, linha);
        linha := StringReplace(linha, nomeClasse, edClasse.Text, [rfReplaceAll, rfIgnoreCase]);
        linha := StringReplace(linha, '[TABELA]', edTabela.Text, [rfReplaceAll, rfIgnoreCase]);

        if not ExecutaMetodos(linha) then
            memo.Lines.Add(linha)
    end;
    CloseFile(arquivoBase);
end;

procedure TfrmGeradorClasse.CRIAR_GETSET_ASSINATURA;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('        F' + campo.NomePropriedade + ': ' + campo.TipoPropriedade+';');
    end;

    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('        procedure Set' + campo.NomePropriedade + '(const Value: ' + campo.TipoPropriedade + ');'); ;
    end;
    mmClasse.Lines.Add('');
end;

procedure TfrmGeradorClasse.CRIAR_GETSET_CORPO;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('procedure T' + edClasse.Text+'.Set'+campo.NomePropriedade +  '(const Value: ' + campo.TipoPropriedade + ');'); ;
        mmClasse.Lines.Add('begin');
        mmClasse.Lines.Add('    F'+campo.NomePropriedade+' := Value;');
        mmClasse.Lines.Add('end;');
        mmClasse.Lines.Add('');
    end;

end;


procedure TfrmGeradorClasse.CRIAR_GRID_CONSULTA;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmConsultaPAS.Lines.Add('    grDados.AddCol(' + QuotedStr(campo.NomePropriedade) + ', ' + QuotedStr(campo.NomePropriedade) + ', ' +
          inttostr(campo.Tamanho + 50) + ', RGrid.' + obterTipoMascara(campo.TipoPropriedade) + ');');
    end;
end;

function TfrmGeradorClasse.IfTernario(condicao: boolean; verdadeiro, falso: variant): variant;
begin
    if condicao then
        result := verdadeiro
    else
        result := falso;
end;

function TfrmGeradorClasse.ObterCampos: string;
begin
    result := ObterCampos(false);
end;

function TfrmGeradorClasse.ObterCampos(parametro: boolean): string;
var
    I: integer;
    fields: string;
    list: Tlist;
    campo: Tcampo;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        fields := fields + IfTernario(parametro, ':', '') + campo.NomeColuna + IfTernario(I = list.Count - 1, '', ', ');
    end;
    result := fields;
end;

procedure TfrmGeradorClasse.CRIAR_CAMPOS_FILTRO;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('        campoFiltro := TFieldFilter.Create; ');
        mmClasse.Lines.Add('        campoFiltro.Description := ' + QuotedStr(campo.NomePropriedade) + '; ');
        mmClasse.Lines.Add('        campoFiltro.Name := ' + QuotedStr(campo.NomePropriedade) + '; ');
        mmClasse.Lines.Add('        campoFiltro.MaskTypes := mtNone; ');
        mmClasse.Lines.Add('        campoFiltro.GridSize := 100; ');
        mmClasse.Lines.Add('        campoFiltro.FieldType := fdNormal; ');
        mmClasse.Lines.Add('        filtro.AddField(campoFiltro); ');
        mmClasse.Lines.Add(' ');
    end;
end;

procedure TfrmGeradorClasse.CRIAR_INDICES_FILTRO;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('        filtro.AddIndex(' + inttostr(I + 1) + ', ''' + campo.NomePropriedade + '=' + campo.NomeColuna + ''', ''' +
          campo.NomePropriedade + '''); ');
    end;
end;

procedure TfrmGeradorClasse.CRIAR_COMPONENTES_DFM;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
    toplabel, topedit: integer;
const
    alturaLabel: integer = 13;
const
    alturaEdit: integer = 21;
begin
    toplabel := 16;
    topedit := 32;
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmCadastroDFM.Lines.Add('');
        mmCadastroDFM.Lines.Add('      object lbl' + campo.NomePropriedade + ': TLabel');
        mmCadastroDFM.Lines.Add('        Left = 12');
        mmCadastroDFM.Lines.Add('        Top = ' + inttostr(toplabel));
        mmCadastroDFM.Lines.Add('        Width = 31');
        mmCadastroDFM.Lines.Add('        Height = 13');
        mmCadastroDFM.Lines.Add('        Caption = ' + QuotedStr(campo.NomePropriedade));
        mmCadastroDFM.Lines.Add('      end');
        mmCadastroDFM.Lines.Add('      object ed' + campo.NomePropriedade + ': TREdit');
        mmCadastroDFM.Lines.Add('        Left = 12');
        mmCadastroDFM.Lines.Add('        Top = ' + inttostr(topedit));
        mmCadastroDFM.Lines.Add('        Width = ' + inttostr(campo.Tamanho + 50));
        mmCadastroDFM.Lines.Add('        Height = 21');
        mmCadastroDFM.Lines.Add('        CharCase = ecUpperCase ');
        mmCadastroDFM.Lines.Add('        TabOrder = ' + inttostr(I));
        mmCadastroDFM.Lines.Add('        FieldName = ' + QuotedStr(campo.NomePropriedade));
        mmCadastroDFM.Lines.Add('        MaskType = ' + obterTipoMascara(campo.TipoPropriedade));
        mmCadastroDFM.Lines.Add('        MaxLength = ' + inttostr(campo.Tamanho + 50));
        mmCadastroDFM.Lines.Add('        MandatoryField = False');
        mmCadastroDFM.Lines.Add('        PersistentField = true');
        mmCadastroDFM.Lines.Add('        SaveLiteralCharacters = False');
        mmCadastroDFM.Lines.Add('        DecimalPlaces = 2');
        mmCadastroDFM.Lines.Add('      end');

        toplabel := toplabel + 40;
        topedit := topedit + 40;
    end;
end;

procedure TfrmGeradorClasse.CRIAR_COMPONENTES_PAS;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmCadastroPAS.Lines.Add('    lbl' + campo.NomePropriedade + ': TLabel;');
        mmCadastroPAS.Lines.Add('    ed' + campo.NomePropriedade + ': TREdit;');
    end;

end;

procedure TfrmGeradorClasse.CRIAR_PRENCHER_OBJETO;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        mmClasse.Lines.Add('    Self.' + trim(campo.NomePropriedade) + ' := ' + edClasse.Text + '.' + trim(campo.NomePropriedade) + ';');
    end;
    mmClasse.Lines.Add(' ');
end;

procedure TfrmGeradorClasse.CRIAR_PROPRIEDADES;
var
    campo: Tcampo;
    I: integer;
    list: Tlist;
begin
    list := RGrid1.GetSelectedItems;
    for I := 0 to list.Count - 1 do
    begin
        campo := Tcampo(list[I]);
        if campo.NomeColuna = 'R_E_C_N_O_' then
            mmClasse.Lines.Add('        [TPersistable(fgUpdateable, ' + QuotedStr(campo.NomeColuna) + ')]')
        else
            mmClasse.Lines.Add('        [TPersistable(fgPersistable, ' + QuotedStr(campo.NomeColuna) + ')]');

        if campo.Tamanho > 0 then
            mmClasse.Lines.Add('        [TMaxLenght(' + inttostr(campo.Tamanho) + ')]');

        mmClasse.Lines.Add('        property ' + campo.NomePropriedade + ': ' + campo.TipoPropriedade + ' read F'+campo.NomePropriedade+' write Set'+campo.NomePropriedade+';');
        mmClasse.Lines.Add('');
    end;
end;

procedure TfrmGeradorClasse.edTabelaExit(Sender: TObject);
begin
    edAlias.Text := copy(edTabela.Text, 1, 3);
end;

function TfrmGeradorClasse.obterTipoPopropriedade(tipoSQL: string): string;
begin
    result := EmptyStr;
    if (tipoSQL = 'varchar') or (tipoSQL = 'vhar') then
        result := 'string'
    else if (tipoSQL = 'int') then
        result := 'integer'
    else if (tipoSQL = 'float') or (tipoSQL = 'real') then
        result := 'double'
    else if (tipoSQL = 'money') then
        result := 'currency'
    else if (tipoSQL = 'date') or (tipoSQL = 'dateTime') then
        result := 'TDateTime';
end;

function TfrmGeradorClasse.obterTipoMascara(tipoSQL: string): string;
begin
    result := EmptyStr;
    if (tipoSQL = 'string') then
        result := 'mtString'
    else if (tipoSQL = 'integer') then
        result := 'mtInteger'
    else if (tipoSQL = 'double') then
        result := 'mtDouble'
    else if (tipoSQL = 'currency') then
        result := 'mtCurrency'
    else if (tipoSQL = 'TDateTime') then
        result := 'mtDate';
end;

procedure TfrmGeradorClasse.CRIAR_USES(linha: string; numeroLinha: integer);
begin
    linha := StringReplace(linha, '{GERAR_USES}', ', UI.' + edClasse.Text + '.Consulta' + '{GERAR_USES}', [rfReplaceAll, rfIgnoreCase]);
    arquivoPrincipal[numeroLinha] := linha
end;

procedure TfrmGeradorClasse.CRIAR_USES_DETALHES(linha: string);
var
    usesDetalhes: string;
    detalhe: TDetalhe;
begin
    for detalhe in Detalhes do
    begin
        usesDetalhes := usesDetalhes + 'Biz.'+detalhe.NomeClasse+',';
    end;
    delete(usesDetalhes,length(usesDetalhes),1);

    linha := StringReplace(linha, '[CRIAR_USES_DETALHES]', usesDetalhes, [rfReplaceAll, rfIgnoreCase]);
    mmClasse.Lines.Add(linha);
end;

procedure TfrmGeradorClasse.CRIAR_METODO(linha: string; numeroLinha: integer);
begin
    linha := StringReplace(linha, '{GERAR_METODO_'+cbModulo.Value+'}', 'procedure Cadastro' + edClasse.Text + ';' + #13 + #10 + '            {GERAR_METODO_'+cbModulo.Value+'}',
      [rfReplaceAll, rfIgnoreCase]);
    arquivoPrincipal[numeroLinha] := linha
end;

procedure TfrmGeradorClasse.CRIAR_CORPO_METODO(linha: string; numeroLinha: integer);
var
    alterado: string;
begin
    alterado := 'procedure TFrmPrincipal.Cadastro' + edClasse.Text + ';' + #13 + #10;
    alterado := alterado + 'begin' + #13 + #10;
    alterado := alterado + '    tlib.AbrirFormulario(TfrmCon' + edClasse.Text + ');  ' + #13 + #10;
    alterado := alterado + 'end;' + #13 + #10;
    alterado := alterado + '{GERAR_CORPO_METODO}' + #13 + #10;

    linha := StringReplace(linha, '{GERAR_CORPO_METODO}', alterado, [rfReplaceAll, rfIgnoreCase]);
    arquivoPrincipal[numeroLinha] := linha

end;

end.
