unit Lib.Persistable;

interface

// uses System.SysUtils, Rtti;

type
    TFlag = (fgPersistable, fgUpdateable, fgReadOnly);

    TReferenceTable = class(TCustomAttribute)
    private
        FTableName: string;
    public
        constructor Create(pTableName: string);
        property TableName: string read FTableName;
    end;

    TPersistable = class(TCustomAttribute)
    private
        FFlag: TFlag;
        FFieldName: string;
        procedure SetFlag(const Value: TFlag);
    public
        constructor Create(pFlag: TFlag; pFieldName: string); overload;
        property Flag: TFlag read FFlag write SetFlag;
        property FieldName: string read FFieldName;
    end;

    TMaxLenght = class(TCustomAttribute)
    private
        FMaxLenght: integer;
        procedure SetMaxLenght(const Value: integer);
    public
        property MaxLenght: integer read FMaxLenght write SetMaxLenght;
        constructor Create(maxLenght: integer);
    end;




implementation

{ TPersistable }

constructor TPersistable.Create(pFlag: TFlag; pFieldName: string);
begin
    self.FFieldName := pFieldName;
    self.FFlag := pFlag;
end;

procedure TPersistable.SetFlag(const Value: TFlag);
begin
    FFlag := Value;
end;

{ TReferenceTable }

constructor TReferenceTable.Create(pTableName: string);
begin
    Self.FTableName := pTableName;
end;

{ TMaxLenght }

constructor TMaxLenght.Create(maxLenght: integer);
begin
    FMaxLenght := maxLenght;
end;

procedure TMaxLenght.SetMaxLenght(const Value: integer);
begin
  FMaxLenght := Value;
end;


end.
