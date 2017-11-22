unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Generics.cOLLECTIONS,
  DBConnectSIATD_TLB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RichEdit1: TRichEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    function ConverteXMLToCharacter(valor: WideString): WideString;
    function PegaParametro(cString: WideString; cPosicao,
      cSeparador: WideString): WideString;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  DataControl : IDataControl;
  Parametro   : IParameter;
  comando     : string;
begin
  DataControl := CoSQLDataControl.Create() as IDataControl;
  Parametro  := CoParameters.Create() as IParameter;

//  Parametro.Add('S01_LOGIN','JAMES','','');
//  parametro.Add('S01_SENHA','','','');
//  parametro.Add('VERSAOSERVER','3.15.1.29','','');
//
//  comando :=   'SELECT @@Spid as SPID, @@ServerName as ServerName, DB_Name() as [Database],'+
//               ' S01_LOGIN, S01_NOME, S01_SENHA, S01_BLOQUEADO,  S01_MUDASENHA, S01_ALTERASENHA, S01_SRA_EMPRESA, '+
//               ' S01_SRA_FILIAL, S01_SRA_MAT,S01_CRACHA, S01_MUDADATA,  S01_OBSTROCSENHA, S01_TPOBSENHA, S01_DTALTSENHA, '+
//               ' S01_ACESSO_FULL, S01_EXTERNO, S01.D_E_L_E_T_, S01.R_E_C_N_O_, S01_BANCO_MS, S01_CODIGOIMPRESSORA, '+
//               ' S01_MULTIPLAINSTANCIA,  ISNULL(RA.RA_VEND, '''') RA_VEND FROM SIATD_S01 AS S01  '+
//               ' LEFT OUTER JOIN SRA010 AS RA ON S01_SRA_FILIAL = RA.RA_FILIAL AND S01_SRA_MAT = RA.RA_MAT AND RA.D_E_L_E_T_ = '''' '+
//               ' AND RA.RA_SITFOLH = ''''  WHERE S01_LOGIN = :S01_LOGIN AND S01_SENHA = :S01_SENHA AND S01.D_E_L_E_T_ = '''' ';

  Parametro.Add('ALIAS','Z87','','');
  comando := 'SELECT Z87_ITENS, Z87_FATOR FROM Z87010 WITH(NOLOCK) WHERE Z87_FILIAL = '''' '+
             'AND Z87_NUMERO = ''000003'' AND (Z87_PZINIC <= 0 AND Z87_PZFIM >= 0) AND (Z87_VLINIC <= -800.00 AND Z87_VLFIM >= -800.00) '+
             ' AND R_E_C_N_O_ > 0 AND D_E_L_E_T_ = '''' ' ;

//  RichEdit1.Text := DataControl.ExecuteQuery(UpperCase(comando),NIL);

//  comando := ' SELECT BZ_TDCOMIS, BZ_TDPERCE, B1_TDCOMIS, B1_TDPERCE, B1_COMIS    '+
//             ' FROM SB1010 AS B1 LEFT OUTER JOIN SBZ010 AS BZ  ON BZ_COD = B1_COD AND BZ.D_E_L_E_T_<>''*''  '+
//             ' WHERE BZ_FILIAL = ''02'' AND B1_COD = ''012705''  AND B1.D_E_L_E_T_<>''*''';

//  comando := 'SELECT S17_NOMETABELA FROM SIATD_S17_01 WHERE S17_ALIAS = :ALIAS ';

//  comando :=  'SELECT  B1_CODBAR, B1_COD,B1_DESC,B1_SEGUM FROM SB1010  AS SB1 INNER JOIN SB0010 AS SB0 ON B1_FILIAL = '''' AND B1_COD = B0_COD '+
//              ' AND SB1.R_E_C_N_O_ > 0  AND SB1.D_E_L_E_T_ = '''' INNER JOIN SB2010 AS SB2 ON B2_FILIAL = B0_FILIAL AND '+
//              ' B2_LOCAL = ''01'' AND B2_COD = B0_COD AND SB2.R_E_C_D_E_L_ = 0 WHERE B1_DESC LIKE :Nome+''%'' AND B1_SEGUM = :Seg ';

  //RichEdit1.Text := DataControl.ExecuteQuery(UpperCase(comando),(Parametro as _Parameters));
end;

function TForm1.PegaParametro(cString: WideString; cPosicao, cSeparador: WideString): WideString;
var
  cReturn, cAux: WideString;
  iPosicaoSep, iTamSep, iQtPos: Integer;
begin
  iTamSep := Length(cSeparador);
  cReturn := cString;
  iQtPos := 1;
  while iQtPos <= StrToIntDef(cPosicao, 1) do
  begin
    iPosicaoSep := Pos(cSeparador, cReturn);
    if iPosicaoSep = 0 then
    begin
      iPosicaoSep := Length(cReturn) + 1;
    end;
    cAux := Copy(cReturn, 1, (iPosicaoSep - 1));
    cReturn := Copy(cReturn, (Length(cAux) + 1 + iTamSep), (Length(cReturn)));
    iQtPos := iQtPos + 1;
  end;
  cReturn := cAux;
  result := cReturn;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  DataControl : IDataControl;
  Parametro   : IParameter;
  comando     : string;
  MyElem: TObject;
  Retorno: TDictionary<string,string>;
begin
//   DataControl := CoSQLDataControl.Create() as IDataControl;
//   Parametro  := CoParameters.Create() as IParameter;
//   Parametro.Add('Codigo','000001','','');
//
//   Retorno := TDictionary<string,string>.Create();
//
//   Retorno.Add(PegaParametro( PegaParametro(DataControl.ExecuteProc('usp_teste',(Parametro as _Parameters)),'1',';'),'1','|'),
//     PegaParametro( PegaParametro(DataControl.ExecuteProc('usp_teste',(Parametro as _Parameters)),'1',';'),'2','|')
//    );
//
//   RichEdit1.Text := PegaParametro(DataControl.ExecuteProc('usp_teste',(Parametro as _Parameters)),'1',';');
end;

procedure TForm1.Button3Click(Sender: TObject);
VAR
  DataControl : IDataControl;
  Parametro   : IParameter;
  comando     : string;
  MyElem: TObject;
  Retorno: TDictionary<string,string>;
begin
   DataControl := CoSQLDataControl.Create() as IDataControl;
   Parametro  := CoParameters.Create() as IParameter;
   Parametro.Add('B1_DESC','CIMENT','','');

  RichEdit1.Text := DataControl.Query('SELECT B1_COD, B1_DESC FROM SB1010 WHERE B1_DESC LIKE :B1_DESC + % ',(Parametro AS _Parameters),'','',0);
end;

function TForm1.ConverteXMLToCharacter(valor: WideString): WideString;
var
    Texto: string;
begin
    Texto := StringReplace(valor, '&amp;', '&', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&lt;', '<', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&gt;', '>', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&apos;', '''', [rfReplaceAll]);
    Texto := StringReplace(Texto, '&quot;', '"', [rfReplaceAll]);
    Result := Texto;
end;

end.



