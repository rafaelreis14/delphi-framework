unit RCheckBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Dialogs;

type
  TRCheckBox = class(TCheckBox)
  private
    FMandatoryField: boolean;
    FPersistentField: boolean;
    FFieldName: String;
    FCheckedValue: string;
    FUncheckedValue: string;
    FValue: string;
    procedure SetFieldName(const Value: String);
    procedure SetMandatoryField(const Value: boolean);
    procedure SetPersistentField(const Value: boolean);
    procedure SetCheckedValue(const Value: string);
    procedure SetUncheckedValue(const Value: string);
    function GetValue: String;
    procedure SetValue(const Value: String);
    { Private declarations }
  protected
    { Protected declarations }
  published
    property FieldName:String read FFieldName write SetFieldName;
    property MandatoryField: boolean read FMandatoryField write SetMandatoryField;
    property PersistentField: boolean read FPersistentField write SetPersistentField;
    property CheckedValue: string read FCheckedValue write SetCheckedValue;
    property UncheckedValue: string read FUncheckedValue write SetUncheckedValue;
  public
    property Value:String read GetValue write SetValue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SIATD', [TRCheckBox]);
end;

{ TRCheckBox }


function TRCheckBox.GetValue: String;
begin
   if self.Checked then
      result := FCheckedValue
   else
      result := FUncheckedValue
end;

procedure TRCheckBox.SetValue(const Value: String);
begin
   if Value = FCheckedValue then
      self.Checked := true
   else
   if Value = FUncheckedValue then
      self.Checked := false
   else
        MessageDlg('Valor passado não corresponde com os valores setados no componente: '+ self.Name,mtError,[mbOK],0);
end;

procedure TRCheckBox.SetCheckedValue(const Value: string);
begin
  FCheckedValue := Value;
end;

procedure TRCheckBox.SetFieldName(const Value: String);
begin
  if FFieldName <> Value then
    FFieldName := Value;
end;

procedure TRCheckBox.SetMandatoryField(const Value: boolean);
begin
  if FMandatoryField <> Value then
    FMandatoryField := Value;
end;

procedure TRCheckBox.SetPersistentField(const Value: boolean);
begin
  if FPersistentField <> Value then
    FPersistentField := Value;
end;

procedure TRCheckBox.SetUncheckedValue(const Value: string);
begin
  FUncheckedValue := Value;
end;

end.
