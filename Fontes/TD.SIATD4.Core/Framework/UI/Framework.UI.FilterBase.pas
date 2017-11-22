unit Framework.UI.FilterBase;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Framework.UI.FormBase, REdit, RComboBox, RGrid, RSearch, RCheckListBox,
    Lib.ResultFilter, Lib.Filter, UntErrorProvider, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
    Lib.Parametro, Vcl.Menus, Vcl.ExtCtrls, System.Generics.Collections;

type
    TFrmFilterBase = class(TFrmBase)
        grdSearch: TRGrid;
        pnInformacoes: TPanel;
        lbl1: TLabel;
        Panel4: TPanel;
        cbComponents: TScrollBox;
        cbIndexes: TRComboBox;
        pnBotoes: TPanel;
        Bevel1: TBevel;
        btnCancelar: TBitBtn;
        btnFiltrar: TBitBtn;
        btnSelecionar: TBitBtn;
        btnImprimir: TBitBtn;
        Panel2: TPanel;
        Panel1: TPanel;
        lblLetreiro: TLabel;
        ppVisualizar: TPopupMenu;
        VisualizarCadastro1: TMenuItem;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnCancelarClick(Sender: TObject);
        procedure btnFiltrarClick(Sender: TObject);
        procedure btnImprimirClick(Sender: TObject);
        procedure btnSelecionarClick(Sender: TObject);
        procedure btnSelecionarExit(Sender: TObject);
        procedure cbIndexesClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure VisualizarCadastro1Click(Sender: TObject);
        procedure grdSearchExit(Sender: TObject);
        procedure cbIndexesExit(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure cbComponentsExit(Sender: TObject);
    private
        FResultFilter: TResultFilter;

        procedure SetFilter(const Value: IFilterable);
        procedure SetResultFilter(const Value: TResultFilter);

        procedure ExitComponent(Sender: TObject);

    protected
        Select: Boolean;
        FIndexes: TStringList;
        FFilter: IFilterable;
        list: Tlist;

    public
        property ResultFilter: TResultFilter read FResultFilter write SetResultFilter;
        property Filter: IFilterable read FFilter write SetFilter;

        procedure CreateComponents;
        procedure SetComponetsFree;
        function GetIndexes: String;
        function MandatoryFieldValidation: Boolean;
        function GetParameters: TParametro;
        procedure Filtering;
        procedure Selecting;
        procedure SetGridRows;

        function GetFieldByComponentName(componentName: string): TFieldFilter;
        function GetComponentNameByName(childName: string): string;
        function GetFieldByName(name: string): TFieldFilter;

    end;

var
    frmFilterBase: TFrmFilterBase;

implementation

uses
    System.Rtti, Lib.Enumeradores, Datasnap.DBClient, Dal.ControleDados,
    Lib.Biblioteca, Lib.Aguarde, Biz.ParametroSistema;

{$R *.dfm}
{ TFrmFilterBase }

procedure TFrmFilterBase.btnCancelarClick(Sender: TObject);
begin
    inherited;
    close;
end;

procedure TFrmFilterBase.btnFiltrarClick(Sender: TObject);
begin
    inherited;
    if Filter._FilterType <> ftAlredyFilteredWithParameters then
        if not MandatoryFieldValidation then
            exit;

    Filtering;
end;

procedure TFrmFilterBase.btnImprimirClick(Sender: TObject);
var
    obj: TObject;
    param: TParametro;
begin
    // caso ja tenha parametro
    // if FFilter._FilterType = ftNormal then
    param := GetParameters;
    // else
    // param := FFilter._Parametro;
    //
    if param = nil then
    begin
        tlib.MensagemErro('Erro ao imprimir relat�rio', 'par�metros n�o selecionados.');
        exit;
    end;
    //
    // REIS VERIFICAR
    // TRelatorio.ExecutarRelatorio(tiCliente, Filter._Task,param);

end;

procedure TFrmFilterBase.btnSelecionarClick(Sender: TObject);
begin
    Select := true;
    Selecting;
end;

procedure TFrmFilterBase.btnSelecionarExit(Sender: TObject);
begin
    inherited;
    if (pnInformacoes.Visible) and (tlib.Mobile = false) then
        cbIndexes.SetFocus
end;

procedure TFrmFilterBase.cbComponentsExit(Sender: TObject);
begin
    inherited;
    if (tlib.Mobile = false) then
        btnFiltrar.SetFocus;
end;

procedure TFrmFilterBase.cbIndexesClick(Sender: TObject);
begin
    inherited;
    SetComponetsFree;
    CreateComponents;
    FIndexes.CommaText := cbIndexes.Value;
end;

procedure TFrmFilterBase.cbIndexesExit(Sender: TObject);
begin
    inherited;
    if (tlib.Mobile = false) then
        cbComponents.SetFocus;
end;

procedure TFrmFilterBase.CreateComponents;
var
    indexes: TStringList;
    I: integer;
    lbl: TLabel;
    ed: TREdit;
    sc: TRSearch;
    clb: TRCheckListBox;
    cb: TRComboBox;
    field: TFieldFilter;
    lastTop: integer;
    lastHeight: integer;
    componentNumber: integer;
    context: TRttiContext;
    prop: TRttiProperty;
    Value: string;
begin
    try
        lastTop := 6;
        componentNumber := 0;
        for I := 0 to Filter.CountFields - 1 do
        begin
            field := Filter._FieldsFilter(I);
            if Pos(field.name, cbIndexes.Value) > 0 then
            begin
                lbl := TLabel.Create(cbComponents);
                lbl.Top := lastTop + 2;
                lbl.Left := 8;
                lbl.Width := 123;
                lbl.Height := 13;
                lbl.Caption := field.Description + ':';
                lbl.name := 'lbl' + IntToStr(componentNumber);
                // lbl.Parent := cbComponents;
                cbComponents.InsertControl(lbl);

                if field.FieldType = fdNormal then
                begin
                    ed := TREdit.Create(cbComponents);
                    ed.Left := 151;
                    ed.Top := lastTop;
                    ed.Width := 272;
                    ed.Height := 21;
                    ed.TabOrder := I;
                    ed.name := 'component' + IntToStr(componentNumber);
                    ed.Text := EmptyStr;
                    ed.FieldName := field.name;
                    ed.CharCase := ecUpperCase;
                    ed.MaskType := REdit.TMaskTypes(field.MaskTypes);
                    ed.OnExit := ExitComponent;
                    field.componentName := ed.name;

                    if Filter._FilterType in [ftWithParameters, ftAlredyFilteredWithParametersChangingValues] then
                        ed.Value := Filter._Parametro.ObterValorParamentro(field.name);

                    componentNumber := componentNumber + 1;
                    lastHeight := ed.Height;
                    // ed.Parent := cbComponents;
                    cbComponents.InsertControl(ed);

                end
                else if field.FieldType in [fdListCombo, fdDataListCombo] then
                begin
                    cb := TRComboBox.Create(cbComponents);
                    cb.Left := 151;
                    cb.Top := lastTop;
                    cb.Width := 272;
                    cb.Height := 22;
                    cb.TabOrder := I;
                    cb.BlankField := true;
                    cb.FieldName := field.name;
                    cb.CharCase := ecUpperCase;
                    cb.name := 'component' + IntToStr(componentNumber);
                    cb.OnExit := ExitComponent;
                    componentNumber := componentNumber + 1;
                    field.componentName := cb.name;

                    lastHeight := cb.Height;
                    // cb.Parent := cbComponents;
                    cbComponents.InsertControl(cb);

                    if field.FieldType = fdListCombo then
                    begin
                        if (field.ParentFields <> EmptyStr) then
                        begin
                            cb.Enabled := false;
                        end
                        else
                            cb.ListValue := field.ListValue;
                    end
                    else if field.FieldType = fdDataListCombo then
                    begin
                        cb.DataSource(field.DataSource);
                        cb.IDFieldName := field.IDFieldName;
                        cb.DescriptionFieldName := field.DescriptionFieldName;
                    end;

                    cb.DataBind;

                    if Filter._FilterType in [ftWithParameters, ftAlredyFilteredWithParametersChangingValues] then
                        cb.Value := Filter._Parametro.ObterValorParamentro(field.name);
                end
                else if field.FieldType = fdSearch then
                begin
                    sc := TRSearch.Create(cbComponents);
                    sc.Left := 151;
                    sc.Top := lastTop;
                    sc.Width := 272;
                    sc.Height := 22;
                    sc.TabOrder := I;
                    // REIS VERIFICAR
                    // sc.CRUD := field.CRUD;
                    sc.IDFieldName := field.IDFieldName;
                    sc.DescriptionFieldName := field.DescriptionFieldName;
                    sc.name := 'component' + IntToStr(componentNumber);
                    sc.OnExit := ExitComponent;

                    if Filter._FilterType in [ftWithParameters, ftAlredyFilteredWithParametersChangingValues] then
                        sc.Value := Filter._Parametro.ObterValorParamentro(field.name);

                    field.componentName := sc.name;
                    componentNumber := componentNumber + 1;
                    lastHeight := sc.Height;
                    // sc.Parent := cbComponents;
                    cbComponents.InsertControl(sc);
                end
                else if field.FieldType in [fdCheckList, fdDataCheckList] then
                begin
                    clb := TRCheckListBox.Create(cbComponents);
                    clb.Left := 151;
                    clb.Top := lastTop;
                    clb.Width := 272;
                    clb.TabOrder := I;
                    clb.Parent := cbComponents;
                    clb.OnExit := ExitComponent;

                    if field.FieldType = fdCheckList then
                        clb.ListValue := field.ListValue
                    else if field.FieldType = fdDataCheckList then
                        clb.DataSource(field.DataSource);

                    clb.IDFieldName := field.IDFieldName;
                    clb.DescriptionFieldName := field.DescriptionFieldName;
                    clb.DataBind;

                    if Filter._FilterType in [ftWithParameters, ftAlredyFilteredWithParametersChangingValues] then
                        clb.Value := Filter._Parametro.ObterValorParamentro(field.name);

                    clb.name := 'component' + IntToStr(componentNumber);
                    field.componentName := clb.name;
                    componentNumber := componentNumber + 1;
                    lastHeight := clb.Height;
                    // clb.Parent := cbComponents;
                    cbComponents.InsertControl(clb);

                end;
                lastTop := lastTop + lastHeight + 8;
            end;
        end;
    finally
        indexes.Free;
    end;

end;

procedure TFrmFilterBase.ExitComponent(Sender: TObject);
var
    context: TRttiContext;
    prop: TRttiProperty;
    Value: string;
    field: TFieldFilter;
    childField: TFieldFilter;
    parentField: TFieldFilter;
    fields: TStringList;
    I: integer;
    Dataset: TClientDataSet;
    parameter: TParametro;
    Dal: TControleDados<TClientDataSet, TDataSetDAO>;
begin
    prop := context.GetType(Sender.ClassType).GetProperty('Value');
    Value := prop.GetValue(Sender).ToString;

    field := GetFieldByComponentName(TComponent(Sender).name);
    field.Value := Value;

    if Value <> EmptyStr then
    begin

        try
            parameter := TParametro.Create;
            Dal := TControleDados<TClientDataSet, TDataSetDAO>.Create;

            if (field.childField <> EmptyStr) then
            begin
                // gets chield fields
                childField := GetFieldByName(field.childField);

                // validate if there is a child field
                if not assigned(childField) then
                begin
                    MessageDlg('N�o foi encontrado o componente filho: ' + field.childField + ' do campo: ' + field.name +
                      '. Favor verificar configura��o do campo de pesquisa.', mtError, [mbOk], 0);
                    exit;
                end;

                // gets parent fields list
                fields := TStringList.Create;
                fields.QuoteChar := ',';
                fields.DelimitedText := childField.ParentFields;

                // loop into parent fields list
                for I := 0 to fields.Count - 1 do
                begin
                    // gets paramets for child field
                    parentField := GetFieldByName(fields[I]);

                    if assigned(parentField) then
                    begin
                        parameter.Add(EmptyStr, parentField.name, parentField.Value);
                    end
                    else
                    begin
                        MessageDlg('N�o foi encontrado o componente Pai: ' + fields[I] + ' do campo: ' + childField.name +
                          '. Favor verificar configura��o do campo de pesquisa.', mtError, [mbOk], 0);
                        exit;
                    end;

                end;

                if (cbComponents.FindComponent(GetComponentNameByName(childField.name)) is TRComboBox) and (childField.FieldType = fdListCombo) then
                begin
                    // Fill in the combobox using the method name passed by
                    // REIS VERIFICAR
                    // Dataset := BaseLib.XmlToDataset(BaseLib.ExecutaTarefa(childField.MethodName,Self.Name,Parameter));
                    Value := GetComponentNameByName(childField.name);
                    TRComboBox(cbComponents.FindComponent(Value)).ListValue.Clear;
                    if Dataset.RecordCount > 0 then
                    begin
                        Dataset.First;
                        while not Dataset.Eof do
                        begin
                            TRComboBox(cbComponents.FindComponent(GetComponentNameByName(childField.name)))
                              .ListValue.Add(Dataset.FieldByName(childField.IDFieldName).AsString + '=' + Dataset.FieldByName(childField.IDFieldName)
                              .AsString);
                            Dataset.Next;
                        end;
                    end;
                    TRComboBox(cbComponents.FindComponent(GetComponentNameByName(childField.name))).DataBind;
                    TRComboBox(cbComponents.FindComponent(GetComponentNameByName(childField.name))).Enabled := true;

                    TRComboBox(cbComponents.FindComponent(GetComponentNameByName(childField.name))).SetFocus;
                end;
            end;
        finally
            if Dal <> nil then
                FreeAndNil(Dal);

            fields.Free;
            Dataset.Free;
            FreeAndNil(parameter);
        end;
    end;
end;

procedure TFrmFilterBase.Filtering;
var
    param: TParametro;
    item, itemRetorno: TItemParametro;
    tamanho: integer;
begin
    try
        if tlib.Mobile then
            tamanho := 12
        else
            tamanho := 16;

        TAguarde.AguardandoFinalizacaoProcesso(Application.mainform, tamanho, 'Aguarde filtrando informa��o.');

        // caso ja tenha parametro
        // se for ftWithParameters eu tenho que obter os parametro pois eles s� server para preencher inicialmente os campos com valor defaltu
        if Filter._FilterType in [ftNormal, ftWithParameters, ftAlredyFilteredWithParametersChangingValues] then
        begin
            param := GetParameters;
            // adiciono os parametros padr�o (verificar melhor pois ele adiciona todos os parametros iniciais passados, ate mesmo os que foram passados para preenchimento inicial, mas que nao fazem diferen�a se passados para a query)
            if Filter._Parametro <> nil then
                for item in Filter._Parametro.item do
                    param.Add(item);

        end
        else
            param := Filter._Parametro;

        list := Filter.Filtering(param);
        //
        ResultFilter.Parameters := param;
        if Filter._OperationType = otFilter then
        begin
            ResultFilter.list := list;
            close;
        end
        else if Filter._OperationType = otSelect then
        begin
            grdSearch.DataSource(list);
            grdSearch.DataBind;
        end;
    finally
        if (Filter._OperationType = otSelect) then
            grdSearch.SetFocus;

        TAguarde.ProcessoFinalizado;
        // List.Free;
    end;
end;

procedure TFrmFilterBase.FormActivate(Sender: TObject);
begin
    inherited;
    if (grdSearch.Visible) and (not grdSearch.IsEmpty) then
        grdSearch.SetFocus;
end;

procedure TFrmFilterBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    inherited;
    if not(Select) then
        tlib.LiberarListaMemoria(list);
    //
    FIndexes.Free;
end;

procedure TFrmFilterBase.FormCreate(Sender: TObject);
begin
    inherited;
    FResultFilter := TResultFilter.Create;
end;

procedure TFrmFilterBase.FormShow(Sender: TObject);
var
    I: integer;
begin
    // Verifica se nao tem items e se tem dataset para pegar os campos de l�
    // if Filter.CountFields = 0 then
    // begin
    // MessageDlg('Nenhum campo configurado para este filtro',mtError,[mbOK],0);
    // exit;
    // end;

    Select := false;
    ResultFilter := TResultFilter.Create;

    // Preenche o combo com os indices
    cbIndexes.DescriptionFieldName := 'Description';
    cbIndexes.IDFieldName := 'Field';
    cbIndexes.DataSource<TIndex>(Filter.GetIndexs);
    cbIndexes.BlankField := false;
    cbIndexes.DataBind;

    // Valida Tipo de Opera��o
    if (Filter._OperationType = otFilter) then
    begin
        Height := 279;
        grdSearch.Visible := false;
        btnSelecionar.Enabled := false;
        // btnImprimir.Enabled := false;
    end
    else
    begin
        Height := 455;
        grdSearch.Visible := true;
        if Filter._MultiSelect then
            grdSearch.MultiSelect := true;

        btnSelecionar.Enabled := true;
    end;

    lblLetreiro.Caption := Filter._ScreenName;

    SetGridRows;

    // Valida tipo de filtro
    if Filter._FilterType <> ftAlredyFilteredWithParameters then
    begin
        CreateComponents;
        FIndexes := TStringList.Create;
        FIndexes.CommaText := cbIndexes.Value;
        cbIndexes.SetFocus;
    end;

    if Filter._FilterType in [ftAlredyFilteredWithParameters, ftAlredyFilteredWithParametersChangingValues] then
    begin

        if Filter._FilterType = ftAlredyFilteredWithParameters then
        begin
            Height := 300;
            pnInformacoes.Visible := false;
            grdSearch.Align := alClient;

        end;

        Filtering;

        if not grdSearch.IsEmpty then
            grdSearch.SetFocus;

    end;

    if TParametroSistema.ObterParametroSistema('HOMOLOGA') = 'SIM' then
        Panel1.Color := clRed;
end;

function TFrmFilterBase.GetComponentNameByName(childName: string): string;
var
    I: integer;
begin
    result := EmptyStr;
    for I := 0 to Filter.CountFields - 1 do
    begin
        if Filter._FieldsFilter(I).name = childName then
        begin
            result := Filter._FieldsFilter(I).componentName;
            exit;
        end;
    end;
end;

function TFrmFilterBase.GetFieldByComponentName(componentName: string): TFieldFilter;
var
    I: integer;
begin
    result := nil;
    for I := 0 to Filter.CountFields - 1 do
    begin
        if Filter._FieldsFilter(I).componentName = componentName then
        begin
            result := Filter._FieldsFilter(I);
            exit;
        end;
    end;
end;

function TFrmFilterBase.GetFieldByName(name: string): TFieldFilter;
var
    I: integer;
begin
    result := nil;
    for I := 0 to Filter.CountFields - 1 do
    begin
        if Filter._FieldsFilter(I).name = name then
        begin
            result := Filter._FieldsFilter(I);
            exit;
        end;
    end;

end;

function TFrmFilterBase.GetIndexes: String;
// var
// indexes:TStringList;
begin
    // indexes := TStringList.Create;
    // indexes.Delimiter := ';';
    // indexes.DelimitedText := cbIndexes.Value;
    // result := indexes;
end;

function TFrmFilterBase.GetParameters: TParametro;
var
    Parametro: TParametro;
    I: integer;
    indexes: string;
    context: TRttiContext;
    prop: TRttiProperty;
    Value: string;
    lastFilledIndex: integer;
    function getLastFilledIndex: integer;
    var
        I: integer;
    begin

        for I := 0 to FIndexes.Count - 1 do
        begin
            if cbComponents.FindComponent('component' + IntToStr(I)) is TComponent then
            begin
                prop := context.GetType(cbComponents.FindComponent('component' + IntToStr(I)).ClassType).GetProperty('Value');
                Value := prop.GetValue(cbComponents.FindComponent('component' + IntToStr(I))).ToString;
                if Value <> EmptyStr then
                    result := I;
            end;
        end;
    end;

begin
    Parametro := TParametro.Create;

    lastFilledIndex := getLastFilledIndex;

    for I := 0 to FIndexes.Count - 1 do
    begin
        if cbComponents.FindComponent('component' + IntToStr(I)) is TComponent then
        begin
            prop := context.GetType(cbComponents.FindComponent('component' + IntToStr(I)).ClassType).GetProperty('Value');
            Value := prop.GetValue(cbComponents.FindComponent('component' + IntToStr(I))).ToString;

            if (Value = EmptyStr) and (I > lastFilledIndex) then
                Value := 'NULL';

            Parametro.Add(EmptyStr, FIndexes.ValueFromIndex[I], Value);
        end;

        indexes := indexes + FIndexes.ValueFromIndex[I] + ',';
    end;

    // delete the last coma
    // Delete(indexes,length(indexes),1);
    // parametro.Add('', 'INDEX',indexes);
    result := Parametro;
end;

procedure TFrmFilterBase.grdSearchExit(Sender: TObject);
begin
    inherited;
    if (tlib.Mobile = false) then
        btnSelecionar.SetFocus;

end;

function TFrmFilterBase.MandatoryFieldValidation: Boolean;
var
    I: integer;
    toValidate: Boolean;
    context: TRttiContext;
    prop: TRttiProperty;
    Value: string;
begin
    toValidate := true;
    result := true;
    for I := 0 to FIndexes.Count - 1 do
    begin
        if cbComponents.FindComponent('component' + IntToStr(I)) is TComponent then
        begin
            prop := context.GetType(cbComponents.FindComponent('component' + IntToStr(I)).ClassType).GetProperty('Value');
            Value := prop.GetValue(cbComponents.FindComponent('component' + IntToStr(I))).ToString;
            if Value <> EmptyStr then
            begin
                toValidate := false;
                break;
            end;
        end;
    end;

    if toValidate then
    begin
        result := false;
        MessageDlg('� necess�rio preencher ao menos um dos par�metros da pesquisa.', mtError, [mbOk], 0);
        cbIndexes.SetFocus;
    end;
end;

procedure TFrmFilterBase.Selecting;
begin
    try
        if Filter._MultiSelect then
        begin
            if not grdSearch.IsEmpty then
            begin
                ResultFilter.list := grdSearch.GetSelectedItems;
                if ResultFilter.list.Count = 0 then
                    ResultFilter.list.Add(grdSearch.GetObject<TObject>)

            end
            else
            begin
                MessageDlg('Selecione pelo menos um registro.', mtError, [mbOk], 0);
                grdSearch.SetFocus;
                exit;
            end;
        end
        else
        begin
            // if ResultFilter.List <> nil then
            ResultFilter.list := Tlist.Create;
            ResultFilter.list.Add(grdSearch.GetObject<TObject>);
        end;
        close;
    finally
        // list.Free;
    end;
end;

procedure TFrmFilterBase.SetComponetsFree;
var
    I: integer;
begin
    for I := 0 to Filter.CountFields - 1 do
    begin
        if assigned(cbComponents.FindComponent('component' + IntToStr(I))) then
            cbComponents.FindComponent('component' + IntToStr(I)).Free;

        if assigned(cbComponents.FindComponent('lbl' + IntToStr(I))) then
            cbComponents.FindComponent('lbl' + IntToStr(I)).Free;
    end;
end;

procedure TFrmFilterBase.SetFilter(const Value: IFilterable);
begin
    FFilter := Value;
end;

procedure TFrmFilterBase.SetGridRows;
var
    I: integer;
begin
    for I := 0 to Filter.CountFields - 1 do
    begin
        grdSearch.AddCol(Filter._FieldsFilter(I).name, Filter._FieldsFilter(I).Description, Filter._FieldsFilter(I).GridSize,
          RGrid.TMaskTypes(Filter._FieldsFilter(I).MaskTypes)
          // Filter._FieldsFilter(I).MaskTypes
          );
    end;

end;

procedure TFrmFilterBase.SetResultFilter(const Value: TResultFilter);
begin
    FResultFilter := Value;
end;

procedure TFrmFilterBase.VisualizarCadastro1Click(Sender: TObject);
begin
    try
        tlib.AbrirFormulario(Filter._InputForm, acVisualizacao, grdSearch.GetObject<TObject>)
    except
        tlib.MensagemErro('Erro ao visualizar a tela cadastro', 'Possivelmente o nome da tela n�o foi programada corretamente no filtro da classe');
    end;

end;

end.
