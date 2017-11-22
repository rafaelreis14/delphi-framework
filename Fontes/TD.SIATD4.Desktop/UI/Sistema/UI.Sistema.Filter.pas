unit UI.Sistema.Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, REdit, RComboBox, StdCtrls, Lib.Filter, ComCtrls, DB, ADODB, Mask,
  Provider, DBClient, RGrid, RSearch, Vcl.Buttons, Lib.Biblioteca,
  Lib.Lista, Lib.Base, Lib.Enumeradores,  UntErrorProvider, Vcl.Imaging.jpeg, Lib.Parametro,
  RCheckListBox, RTTI, Lib.ResultFilter,  Lib.Aguarde, Vcl.Menus, Framework.UI.FormBase,
  Framework.UI.FilterBase, Dal.ControleDados;

type

  TfrmFilter = class(TFrmFilterBase)

  end;

var
  frmFilter: TfrmFilter;

implementation


{$R *.dfm}


end.

