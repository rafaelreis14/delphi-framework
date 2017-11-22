unit RSearch;

interface

uses
  System.SysUtils, Vcl.Forms, System.Classes, Winapi.Windows, Vcl.Controls, Vcl.ExtCtrls, RTTI, Vcl.Buttons, REdit, Dialogs,
  Lib.Enumeradores, Framework.Interfaces.CRUDGenerico;

type
  TRSearch = class(TPanel)
  private
    edit: TREdit;
    btn: TBitBtn;
    FDescriptionFieldName: String;
    FFieldName: String;
    FValue: string;
    FIDFieldName: String;
    FMandatoryField: Boolean;
    FPersistentField: boolean;
    FIDFieldWidth: integer;
    FOldValue:string;
    FCRUDGenerico: ICRUDGenerico;
    procedure SetDescriptionFieldName(const Value: String);
    procedure SetFieldName(const Value: String);
    procedure SetIDFieldName(const Value: String);
    function GetValue: string;
    procedure edKeyPress(Sender: TObject; var Key: Char);
    procedure SetMandatoryField(const Value: Boolean);
    procedure SetValue(const Value: string);
    procedure SetPersistentField(const Value: boolean);
    procedure SetIDFieldWidth(const Value: integer);
    procedure Resize;
    procedure SetCRUDGenerico(const Value: ICRUDGenerico);


  protected
    { Protected declarations }
  public
    property Value:string read GetValue write SetValue;
    property CRUDGenerico: ICRUDGenerico read FCRUDGenerico write SetCRUDGenerico;

    procedure btnClick(Sender:TObject);
    procedure pnlKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnlResize(Sender: TObject);
    procedure pnlEnter(Sender: TObject);
    procedure edExit(Sender: TObject);
    procedure edEnter(Sender:TObject);
    procedure SetFocus; override;

    procedure Clear;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published

    property FieldName:String read FFieldName write SetFieldName;
    property IDFieldName:String read FIDFieldName write SetIDFieldName;
    property DescriptionFieldName:String read FDescriptionFieldName write SetDescriptionFieldName;
    property MandatoryField: Boolean read FMandatoryField write SetMandatoryField;
    property PersistentField: boolean read FPersistentField write SetPersistentField;
    property IDFieldWidth:integer read FIDFieldWidth write SetIDFieldWidth;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SIATD', [TRSearch]);
end;

{ TRSearch }

procedure TRSearch.btnClick(Sender: TObject);
var
  list:Tlist;
  context: TRttiContext;
  prop: TRttiProperty;
begin
    if (IDFieldName = EmptyStr)or (DescriptionFieldName = EmptyStr) or (not Assigned(CRUDGenerico)) then
    begin
        MessageDlg('Compoenente n�o configurado corretamente.',mtError,[mbOk],0);
        abort;
    end;
    try
        list := nil;
        list := CRUDGenerico.Listar(otSelect, false).List;

        if list <> nil then
        begin
            if list.Count > 0 then
            begin
                // Find the code of object
                prop := context.GetType(TObject(list[0]).ClassType).GetProperty(IDFieldName);
                text := prop.GetValue(TObject(list[0])).ToString;
                if self.FindComponent('edCode') is TREdit then
                    TREdit(self.FindComponent('edCode')).Value := Text;

                FValue := Text;

                // Find the description of object
                prop := context.GetType(TObject(list[0]).ClassType).GetProperty(DescriptionFieldName);
                text := prop.GetValue(TObject(list[0])).ToString;
                if self.FindComponent('edDescription') is TREdit then
                    TREdit(self.FindComponent('edDescription')).Value := Text;
            end;
        end;

    finally
        if list <> nil then
            list.Free;
    end;

end;

procedure TRSearch.Clear;
begin
    TREdit(self.FindComponent('edCode')).Value := EmptyStr;
    TREdit(self.FindComponent('edDescription')).Value := EmptyStr;
end;

constructor TRSearch.Create(AOwner: TComponent);
var
  hint: string;
begin
    inherited Create(AOwner);

    hint := 'Pressione F3 para pesquisar';

    self.Width := 281;
    self.Height := 21;
    self.BevelOuter := bvNone;
    self.Caption := EmptyStr;
    self.TabStop := true;
    self.TabOrder := 0;
    //self.Color := $00ADADAD;
    self.Text := EmptyStr;
    self.OnEnter := pnlEnter;
    self.ShowHint := true;
    self.Hint := hint;
    Self.IDFieldWidth := 59;
    self.OnResize := pnlResize;

    edit := TREdit.Create(self);
    edit.Left := 0;
    edit.Top := 0;
    edit.Width := 59;
    edit.Height := 22;
    //edit.Enabled := False;
    edit.TabOrder := 1;
    edit.Name := 'edCode';
    edit.Text := EmptyStr;
    edit.ReadOnly := true;
    edit.OnKeyDown := pnlKeyDown;
    edit.ShowHint := true;
    edit.Hint := hint;
    self.InsertControl(edit);
    edit.OnExit := edExit;
    edit.OnEnter := edEnter;

    edit := TREdit.Create(self);
    edit.Left := 60;
    edit.Top := 0;
    edit.Width := 196;
    edit.Height := 22;
    edit.Align := vcl.Controls.alNone;
    edit.TabOrder := 1;
    edit.Name := 'edDescription';
    edit.Text := EmptyStr;
    edit.ReadOnly := true;
    edit.OnKeyDown := pnlKeyDown;
    self.InsertControl(edit);
    edit.ShowHint := true;
    edit.Hint := hint;

    btn := TBitBtn.Create(self);
    btn.Left := 256;
    btn.Top := 0;
    btn.Width := 25;
    btn.Height := 22;
    btn.Align := vcl.Controls.alRight;

    edit.ShowHint := true;
    edit.Hint := hint;
    btn.TabStop := false;
    btn.OnClick := btnClick;
    btn.Name := 'btnFilter';
    btn.Caption := EmptyStr;
    btn.Caption := '...';
    self.InsertControl(btn);


end;

destructor TRSearch.Destroy;
begin
  if self.FindComponent('edCode') is TREdit then
      TREdit(self.FindComponent('edCode')).Free;

  if self.FindComponent('edDescription') is TREdit then
      TREdit(self.FindComponent('edDescription')).Free;

  if self.FindComponent('btnFilter') is TBitBtn then
     TBitBtn(self.FindComponent('btnFilter')).Free;

  inherited Destroy;
end;

procedure TRSearch.edEnter(Sender: TObject);
begin
   FOldValue := TREdit(Sender).Text;
end;

procedure TRSearch.edExit(Sender: TObject);
begin
//  if (TREdit(Sender).Text <> EmptyStr) and (TREdit(Sender).Text <> FOldValue) then
//    SetValue(TREdit(Sender).Text);
end;

procedure TRSearch.edKeyPress(Sender: TObject; var Key: Char);
begin
  if key = char(72) then
    btnClick(self);
end;

function TRSearch.GetValue: string;
begin
   if self.FindComponent('edCode') is TREdit then
      result := TREdit(self.FindComponent('edCode')).value;
    //Result := FValue;
end;

procedure TRSearch.pnlEnter(Sender: TObject);
begin
   if self.FindComponent('edCode') is TREdit then
      TREdit(self.FindComponent('edCode')).SetFocus;
end;

procedure TRSearch.pnlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F3 then
    btnClick(self);
end;

procedure TRSearch.pnlResize(Sender: TObject);
begin
  resize;
end;




procedure TRSearch.SetCRUDGenerico(const Value: ICRUDGenerico);
begin
  FCRUDGenerico := Value;
end;

procedure TRSearch.SetDescriptionFieldName(const Value: String);
begin
  FDescriptionFieldName := Value;
end;

procedure TRSearch.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure TRSearch.SetFocus;
begin
  if self.FindComponent('edCode') is TREdit then
      TREdit(self.FindComponent('edCode')).SetFocus;
end;

procedure TRSearch.SetIDFieldName(const Value: String);
begin
  FIDFieldName := Value;
end;

procedure TRSearch.SetIDFieldWidth(const Value: integer);
var
  dif:integer;
begin
   if FIDFieldWidth <> value then
   begin
        if (self.FindComponent('edCode') is TREdit) and (self.FindComponent('edDescription') is TREdit) and (self.FindComponent('btnFilter') is TBitBtn) then
        begin
           dif := value - TREdit(self.FindComponent('edCode')).Width;

           if value > TREdit(self.FindComponent('edCode')).Width then
               TREdit(self.FindComponent('edDescription')).Width := TREdit(self.FindComponent('edDescription')).Width - dif
           else
              TREdit(self.FindComponent('edDescription')).Width := TREdit(self.FindComponent('edDescription')).Width + dif*-1;

           FIDFieldWidth := value;
           TREdit(self.FindComponent('edCode')).Width := value;

           resize;
        end;
    end;
end;

procedure TRSearch.resize;
begin
   if (self.FindComponent('edCode') is TREdit) and (self.FindComponent('edDescription') is TREdit) and (self.FindComponent('btnFilter') is TBitBtn) then
   begin
       TREdit(self.FindComponent('edDescription')).Width := self.Width - TREdit(self.FindComponent('edCode')).Width - TBitBtn(self.FindComponent('btnFilter')).Width-3;
       TREdit(self.FindComponent('edDescription')).Left := TREdit(self.FindComponent('edCode')).Width+2;
   end;
end;

procedure TRSearch.SetMandatoryField(const Value: Boolean);
begin
    if FMandatoryField <> Value then
        FMandatoryField := Value;
end;

procedure TRSearch.SetPersistentField(const Value: boolean);
begin
  if FPersistentField <> value then
    FPersistentField := Value;
end;

procedure TRSearch.SetValue(const Value: string);
var
  Obj:TObject;
  context: TRttiContext;
  prop: TRttiProperty;

begin
    if (IDFieldName = EmptyStr)or (DescriptionFieldName = EmptyStr) or (not Assigned(CRUDGenerico)) then
    begin
        MessageDlg('Compoenente n�o configurado corretamente.',mtError,[mbOk],0);
        abort;
    end;

    CRUDGenerico.ObterBase(Value);

    if Assigned(CRUDGenerico) then
    begin
        // Find the code of object
        prop := context.GetType(TObject(CRUDGenerico).ClassType).GetProperty(IDFieldName);
        text := prop.GetValue(TObject(CRUDGenerico)).ToString;
        if self.FindComponent('edCode') is TREdit then
            TREdit(self.FindComponent('edCode')).Value := Text;

        FValue := Text;

        // Find the description of object
        prop := context.GetType(TObject(CRUDGenerico).ClassType).GetProperty(DescriptionFieldName);
        text := prop.GetValue(TObject(CRUDGenerico)).ToString;
        if self.FindComponent('edDescription') is TREdit then
            TREdit(self.FindComponent('edDescription')).Value := Text;
    end
    else
    begin
        TREdit(self.FindComponent('edCode')).Value := EmptyStr;
        TREdit(self.FindComponent('edDescription')).Value := EmptyStr;
        TREdit(self.FindComponent('edCode')).SetFocus;
    end;
end;

end.




