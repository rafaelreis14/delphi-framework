///-------------------- baseado no componente do ErrorProvider do .Net----------
///----Autor: James Dias para Todimo ConstruÁ„o e Acabamento
///----Cuiab† 23/07/2006
///----DescriÁ„o: Componente de ValidaÁ„o de campos obrigatÛrios
///-----------------------------------------------------------------------------

unit UntErrorProvider;

interface
uses Classes, Controls, ExtCtrls, untBlink, Graphics, Windows;

type
  TErrorProvider = class;

  TErrorMessage = procedure(Sender: TObject; CompError: TControl; ErrorMsg:string) of object;

  TErrorProvider = class(TComponent)
  private
    FImg: TStringList;
    FCmpErrorMsg: TStringList;
    FPicture: TPicture;
    FOnErrorMessage: TErrorMessage;
    FBlinks: Integer;
    FTime: Integer;
    procedure Blink(index: Integer);virtual;
    procedure SetPicture(const Value: TPicture);
    procedure SetOnErrorMessage(const Value: TErrorMessage);
    procedure SetBlinks(const Value: Integer);
    procedure SetTime(const Value: Integer);
  published
    property Time: Integer read FTime write SetTime default 300;
    property Blinks: Integer read FBlinks write SetBlinks default 10;
    property Picture: TPicture read FPicture write SetPicture;
    property OnErrorMessage: TErrorMessage read FOnErrorMessage write SetOnErrorMessage;
  public
    FFirst : Boolean;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure SetError(Component: TControl; ErrorMsg: string);virtual;
  end;

procedure Register;

implementation

//{$R *.res}

uses Sysutils, Dialogs;

procedure Register;
begin
  RegisterComponents('SIATD', [TErrorProvider]);
end;

procedure TErrorProvider.SetError(Component: TControl; ErrorMsg: string);
Var
  // Vari†vel inteira para guardar o ponteiro do objeto
  CmpPointer: Integer;
  // vari†vel inteira para guardar o index do objeto na lista
  CmpIndex: Integer;
begin
  // Recuperar o ponteiro e o index do componente
  CmpPointer := integer(Component);
  CmpIndex := FCmpErrorMsg.IndexOfObject(Component);
  // Verifica se o componente existe na lista
  if CmpIndex = -1 then
  // Bloco executado caso o componente n∆o exista na lista (-1)
  begin
    // Adiciona o componente Ö lista junto com a mensagem de erro
    FCmpErrorMsg.AddObject(ErrorMsg, Component);
    // Cria o objeto de imagem com referencia ao ponteiro do componente
    FImg.AddObject(IntToStr(Integer(CmpPointer)), nil);
    // Atualiza o indice
    CmpIndex := FCmpErrorMsg.IndexOfObject(Component);
  end
  else
  // C¢digo executado caso o componente exista na lista (>-1)
  begin
    // Atualiza a mensagem de erro
    FCmpErrorMsg.Strings[CmpIndex] := ErrorMsg;
  end;
  // Verifica se h† uma mensagem de erro
  if Length(FCmpErrorMsg.Strings[CmpIndex]) > 0 then
  // C¢digo executado caso exista mensagem de erro (>0)
  begin
    // Chama o mÇtodo Blink (piscar) passando o index como parametro
    Blink(CmpIndex);
  end
  else
  // C¢digo executado caso n∆o exista mensagem de erro (=0)
  begin
    // Verifica se existe imagem vinculada
    if Assigned(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]) then
    // Caso exista a imagem (true)
    begin
      // Libera a mem¢ria do componente de imagem
      TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]).Free;
      // Apaga a referencia da lista
      FImg.Delete(FImg.IndexOf(IntToStr(CmpPointer)));
    end;
    // Apaga o componente da lista
    FCmpErrorMsg.Delete(CmpIndex);
  end;
  Component.Parent.Refresh;
end;

procedure TErrorProvider.Blink;
var
  // Variavel para o componente
  Cmp: TControl;
  // Ponteiro para a imagem
  img: TImage;
  // Vari†vel inteira para guardar o ponteiro do objeto
  CmpPointer: Integer;
  // Variavel da Thread
  blk: TBlink;
begin
  // Recupera o componente da lista
  Cmp := (FCmpErrorMsg.Objects[index] as TControl);

  // Recuperar o ponteiro do componente
  CmpPointer := integer(Cmp);

  // Verifica se existe imagem vinculada
  if not Assigned(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]) then
    // Caso n∆o exista a imagem (false)
  begin
    // Cria e define valores iniciais para a imagem
    img := TImage.Create(Cmp.Owner);
    img.Visible := False;
    img.Parent := Cmp.Parent;
    img.Picture := FPicture;
    img.Transparent := True;
    img.ShowHint := True;
    // Atualiza a referencia para a imagem
    FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))] := img;
  end;
  //Configura o cmponente para piscar

//  ShowMessage(BoolToStr(FFirst));
  if FFirst then
     Cmp.Width := Cmp.Width - 25;


//  showmessage(IntToStr(Cmp.Width));
  TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]).Hint := FCmpErrorMsg.Strings[index];
  TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]).Left := Cmp.Left + Cmp.Width + 1;
  TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]).Top := Cmp.Top + 1;

  // Executa o evento OnErrorMessage
  if Assigned(FOnErrorMessage) then
    FOnErrorMessage(Self, Cmp, FCmpErrorMsg.Strings[index]);

  // C¢digo para piscar a imagem
  blk := TBlink.Create(True);
  blk.Time := FTime;
  blk.Blinks := FBlinks;
  blk.Imagem := TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]);
  blk.Start;
  TImage(FImg.Objects[FImg.IndexOf(IntToStr(CmpPointer))]).Visible := True;
end;

constructor TErrorProvider.Create;
begin
  inherited;
  // Cria as listas e componentes auxiliares
  FCmpErrorMsg := TStringList.Create;
  FImg := TStringList.Create;
  FPicture := TPicture.Create;
  FPicture.Bitmap.Handle := LoadBitmap( hInstance, 'error');
  FTime := 300;
  FBlinks := 10;
  FFirst := True;
end;

destructor TErrorProvider.Destroy;
begin
  // Libera da mem¢ria os componentes auxiliares
  FreeAndNil(FPicture);
  FreeAndNil(FImg);
  FreeAndNil(FCmpErrorMsg);
  inherited;
end;

procedure TErrorProvider.SetPicture(const Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TErrorProvider.SetOnErrorMessage(const Value: TErrorMessage);
begin
  FOnErrorMessage := Value;
end;

procedure TErrorProvider.SetBlinks(const Value: Integer);
begin
  FBlinks := Value;
end;

procedure TErrorProvider.SetTime(const Value: Integer);
begin
  FTime := Value;
end;

end.
