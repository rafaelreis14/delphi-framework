unit RRadioGroup;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TRRadioGroup = class(TRadioGroup)
  private
    FMandatoryField: boolean;
    FPersistentField: boolean;
    FFieldName: String;
    FListValue: TStrings;
    procedure SetFieldName(const Value: String);
    procedure SetMandatoryField(const Value: boolean);
    procedure SetPersistentField(const Value: boolean);
    function GetValue: String;
    procedure SetValue(const Value: String);
    procedure SetListValue(const Value: TStrings);
    { Private declarations }
  protected
    { Protected declarations }
  public
    property Value:String read GetValue write SetValue;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;

  published
    property FieldName:String read FFieldName write SetFieldName;
    property MandatoryField: boolean read FMandatoryField write SetMandatoryField;
    property PersistentField: boolean read FPersistentField write SetPersistentField;
    property ListValue: TStrings read FListValue write SetListValue;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SIATD', [TRRadioGroup]);
end;

{ TRRadioGroup }

constructor TRRadioGroup.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   self.FListValue := TStringList.Create;
end;

destructor TRRadioGroup.Destroy;
begin
   if assigned(FListValue) then
       FListValue.Free;

  inherited Destroy;
end;

function TRRadioGroup.GetValue: String;
begin
  try
    result := FListValue[self.ItemIndex];
  except

  end;
end;

procedure TRRadioGroup.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure TRRadioGroup.SetListValue(const Value: TStrings);
begin
  FListValue.Assign(Value);
end;

procedure TRRadioGroup.SetMandatoryField(const Value: boolean);
begin
  FMandatoryField := Value;
end;

procedure TRRadioGroup.SetPersistentField(const Value: boolean);
begin
  FPersistentField := Value;
end;

procedure TRRadioGroup.SetValue(const Value: String);
var
    i: integer;
    cItem : string;
begin
    for i := 0 to FListValue.Count-1 do
    begin
        cItem := FListValue[i];
        if cItem = Value then
        begin
            self.ItemIndex := i;
            break;
        end;
    end;
end;

end.
