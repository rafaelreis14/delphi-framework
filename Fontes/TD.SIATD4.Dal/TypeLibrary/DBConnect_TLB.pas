unit DBConnect_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 13/07/2016 14:25:49 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Projetos TD\SIATD4\Fontes\Output\exe\DBConnect.dll (1)
// LIBID: {A886F53C-B6D6-4F98-ADCE-248A1BFC5B76}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DBConnectMajorVersion = 1;
  DBConnectMinorVersion = 0;

  LIBID_DBConnect: TGUID = '{A886F53C-B6D6-4F98-ADCE-248A1BFC5B76}';

  IID_IDataControl: TGUID = '{42676162-6DFF-4751-B2BD-FA122C41031C}';
  IID__SQLDataControl: TGUID = '{399390EA-EF05-3277-B402-94ACAE86AFE0}';
  IID_IParameter: TGUID = '{AA2C1BA3-FB06-44C2-84F6-8DB2889617AB}';
  IID__Parameters: TGUID = '{941805EB-25C2-3C9D-9023-472E6D8ABF5A}';
  IID_IParameterItems: TGUID = '{477182FB-72EA-4A97-B23C-965F832E980E}';
  IID__ParameterItems: TGUID = '{AD86CEA6-F8EE-390E-9AAF-BE33C5188913}';
  CLASS_SQLDataControl: TGUID = '{04CBB967-4FA5-41C3-877C-7739E63F64D7}';
  CLASS_Parameters: TGUID = '{E43E448D-5FD1-408D-8644-F773B271E2E8}';
  CLASS_ParameterItems: TGUID = '{B0160A8F-BE46-44FB-8729-B5DA6A212147}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum ConnectionType
type
  ConnectionType = TOleEnum;
const
  ConnectionType_MainConnection = $00000000;
  ConnectionType_SecudanryConnection = $00000001;
  ConnectionType_TertiaryConnection = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDataControl = interface;
  IDataControlDisp = dispinterface;
  _SQLDataControl = interface;
  _SQLDataControlDisp = dispinterface;
  IParameter = interface;
  IParameterDisp = dispinterface;
  _Parameters = interface;
  _ParametersDisp = dispinterface;
  IParameterItems = interface;
  IParameterItemsDisp = dispinterface;
  _ParameterItems = interface;
  _ParameterItemsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SQLDataControl = _SQLDataControl;
  Parameters = _Parameters;
  ParameterItems = _ParameterItems;


// *********************************************************************//
// Interface: IDataControl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {42676162-6DFF-4751-B2BD-FA122C41031C}
// *********************************************************************//
  IDataControl = interface(IDispatch)
    ['{42676162-6DFF-4751-B2BD-FA122C41031C}']
    procedure GhostMethod_IDataControl_28_1; safecall;
    procedure GhostMethod_IDataControl_32_2; safecall;
    function Query(const sqlcommand: WideString; const params: _Parameters; 
                   connection: ConnectionType): WideString; safecall;
    function Insert(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): Integer; safecall;
    function Update(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): WordBool; safecall;
    function Delete(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): WordBool; safecall;
    function StoredProcedure(const storeProc: WideString; const params: _Parameters; 
                             connection: ConnectionType): WideString; safecall;
    function StartTransaction(const params: _Parameters; connection: ConnectionType): WordBool; safecall;
    function Commit(const params: _Parameters; connection: ConnectionType): WordBool; safecall;
    function Rollback(const params: _Parameters; connection: ConnectionType): WordBool; safecall;
    procedure Connect(const applicationName: WideString; const computerName: WideString; 
                      const module: WideString; const userBranch: WideString; 
                      const userName: WideString); safecall;
    procedure Disconnect; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDataControlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {42676162-6DFF-4751-B2BD-FA122C41031C}
// *********************************************************************//
  IDataControlDisp = dispinterface
    ['{42676162-6DFF-4751-B2BD-FA122C41031C}']
    procedure GhostMethod_IDataControl_28_1; dispid 1610743808;
    procedure GhostMethod_IDataControl_32_2; dispid 1610743809;
    function Query(const sqlcommand: WideString; const params: _Parameters; 
                   connection: ConnectionType): WideString; dispid 1610743810;
    function Insert(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): Integer; dispid 1610743811;
    function Update(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): WordBool; dispid 1610743812;
    function Delete(const sqlcommand: WideString; const params: _Parameters; 
                    connection: ConnectionType): WordBool; dispid 1610743813;
    function StoredProcedure(const storeProc: WideString; const params: _Parameters; 
                             connection: ConnectionType): WideString; dispid 1610743814;
    function StartTransaction(const params: _Parameters; connection: ConnectionType): WordBool; dispid 1610743815;
    function Commit(const params: _Parameters; connection: ConnectionType): WordBool; dispid 1610743816;
    function Rollback(const params: _Parameters; connection: ConnectionType): WordBool; dispid 1610743817;
    procedure Connect(const applicationName: WideString; const computerName: WideString; 
                      const module: WideString; const userBranch: WideString; 
                      const userName: WideString); dispid 1610743818;
    procedure Disconnect; dispid 1610743819;
  end;

// *********************************************************************//
// Interface: _SQLDataControl
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {399390EA-EF05-3277-B402-94ACAE86AFE0}
// *********************************************************************//
  _SQLDataControl = interface(IDispatch)
    ['{399390EA-EF05-3277-B402-94ACAE86AFE0}']
  end;

// *********************************************************************//
// DispIntf:  _SQLDataControlDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {399390EA-EF05-3277-B402-94ACAE86AFE0}
// *********************************************************************//
  _SQLDataControlDisp = dispinterface
    ['{399390EA-EF05-3277-B402-94ACAE86AFE0}']
  end;

// *********************************************************************//
// Interface: IParameter
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AA2C1BA3-FB06-44C2-84F6-8DB2889617AB}
// *********************************************************************//
  IParameter = interface(IDispatch)
    ['{AA2C1BA3-FB06-44C2-84F6-8DB2889617AB}']
    function Add(const key: WideString; const value: WideString; const process: WideString; 
                 const line: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IParameterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AA2C1BA3-FB06-44C2-84F6-8DB2889617AB}
// *********************************************************************//
  IParameterDisp = dispinterface
    ['{AA2C1BA3-FB06-44C2-84F6-8DB2889617AB}']
    function Add(const key: WideString; const value: WideString; const process: WideString; 
                 const line: WideString): WordBool; dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _Parameters
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {941805EB-25C2-3C9D-9023-472E6D8ABF5A}
// *********************************************************************//
  _Parameters = interface(IDispatch)
    ['{941805EB-25C2-3C9D-9023-472E6D8ABF5A}']
  end;

// *********************************************************************//
// DispIntf:  _ParametersDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {941805EB-25C2-3C9D-9023-472E6D8ABF5A}
// *********************************************************************//
  _ParametersDisp = dispinterface
    ['{941805EB-25C2-3C9D-9023-472E6D8ABF5A}']
  end;

// *********************************************************************//
// Interface: IParameterItems
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {477182FB-72EA-4A97-B23C-965F832E980E}
// *********************************************************************//
  IParameterItems = interface(IDispatch)
    ['{477182FB-72EA-4A97-B23C-965F832E980E}']
    function Get_key: WideString; safecall;
    procedure Set_key(const pRetVal: WideString); safecall;
    function Get_value: WideString; safecall;
    procedure Set_value(const pRetVal: WideString); safecall;
    function Get_process: WideString; safecall;
    procedure Set_process(const pRetVal: WideString); safecall;
    function Get_line: WideString; safecall;
    procedure Set_line(const pRetVal: WideString); safecall;
    function Get_PriorValue: WideString; safecall;
    procedure Set_PriorValue(const pRetVal: WideString); safecall;
    property key: WideString read Get_key write Set_key;
    property value: WideString read Get_value write Set_value;
    property process: WideString read Get_process write Set_process;
    property line: WideString read Get_line write Set_line;
    property PriorValue: WideString read Get_PriorValue write Set_PriorValue;
  end;

// *********************************************************************//
// DispIntf:  IParameterItemsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {477182FB-72EA-4A97-B23C-965F832E980E}
// *********************************************************************//
  IParameterItemsDisp = dispinterface
    ['{477182FB-72EA-4A97-B23C-965F832E980E}']
    property key: WideString dispid 1610743808;
    property value: WideString dispid 0;
    property process: WideString dispid 1610743812;
    property line: WideString dispid 1610743814;
    property PriorValue: WideString dispid 1610743816;
  end;

// *********************************************************************//
// Interface: _ParameterItems
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AD86CEA6-F8EE-390E-9AAF-BE33C5188913}
// *********************************************************************//
  _ParameterItems = interface(IDispatch)
    ['{AD86CEA6-F8EE-390E-9AAF-BE33C5188913}']
  end;

// *********************************************************************//
// DispIntf:  _ParameterItemsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AD86CEA6-F8EE-390E-9AAF-BE33C5188913}
// *********************************************************************//
  _ParameterItemsDisp = dispinterface
    ['{AD86CEA6-F8EE-390E-9AAF-BE33C5188913}']
  end;

// *********************************************************************//
// The Class CoSQLDataControl provides a Create and CreateRemote method to          
// create instances of the default interface _SQLDataControl exposed by              
// the CoClass SQLDataControl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSQLDataControl = class
    class function Create: _SQLDataControl;
    class function CreateRemote(const MachineName: string): _SQLDataControl;
  end;

// *********************************************************************//
// The Class CoParameters provides a Create and CreateRemote method to          
// create instances of the default interface _Parameters exposed by              
// the CoClass Parameters. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameters = class
    class function Create: _Parameters;
    class function CreateRemote(const MachineName: string): _Parameters;
  end;

// *********************************************************************//
// The Class CoParameterItems provides a Create and CreateRemote method to          
// create instances of the default interface _ParameterItems exposed by              
// the CoClass ParameterItems. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterItems = class
    class function Create: _ParameterItems;
    class function CreateRemote(const MachineName: string): _ParameterItems;
  end;

implementation

uses System.Win.ComObj;

class function CoSQLDataControl.Create: _SQLDataControl;
begin
  Result := CreateComObject(CLASS_SQLDataControl) as _SQLDataControl;
end;

class function CoSQLDataControl.CreateRemote(const MachineName: string): _SQLDataControl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SQLDataControl) as _SQLDataControl;
end;

class function CoParameters.Create: _Parameters;
begin
  Result := CreateComObject(CLASS_Parameters) as _Parameters;
end;

class function CoParameters.CreateRemote(const MachineName: string): _Parameters;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Parameters) as _Parameters;
end;

class function CoParameterItems.Create: _ParameterItems;
begin
  Result := CreateComObject(CLASS_ParameterItems) as _ParameterItems;
end;

class function CoParameterItems.CreateRemote(const MachineName: string): _ParameterItems;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterItems) as _ParameterItems;
end;

end.
