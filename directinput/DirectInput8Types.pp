unit DirectInput8Types;

{$mode delphi}

interface

uses

  windows, directinputtypes, directinput7Types;

const

  DIRECTINPUT_VERSION = $0800;

  SID_IDirectInput8A = '{BF798030-483A-4DA2-AA99-5D64ED369700}';
  SID_IDirectInputDevice8A = '{54D41080-DC15-4833-A41B-748F73A38179}';

  IID_IDirectInput8A: TGUID = '{BF798030-483A-4DA2-AA99-5D64ED369700}';

type

  TDIEnumDevicesCallbackA = function (var lpddi: TDIDeviceInstanceA; pvRef: Pointer): BOOL; stdcall;

  PDIEffectInfoA = ^TDIEffectInfoA;
  PDIEffectInfo = PDIEffectInfoA;
  DIEFFECTINFOA = packed record
    dwSize: DWORD;
    guid: TGUID;
    dwEffType: DWORD;
    dwStaticParams: DWORD;
    dwDynamicParams: DWORD;
    tszName: array[0..MAX_PATH-1] of AnsiChar;
  end;
  DIEFFECTINFO = DIEFFECTINFOA;
  TDIEffectInfoA = DIEFFECTINFOA;
  TDIEffectInfo = TDIEffectInfoA;

  PDIActionA = ^TDIActionA;
  PDIAction = PDIActionA;
  _DIACTIONA = packed record
    uAppData: Pointer;
    dwSemantic: DWORD;
    dwFlags: DWORD;
    case Byte of
      0: (
        lptszActionName: PAnsiChar;
        guidInstance: TGUID;
        dwObjID: DWORD;
        dwHow: DWORD;
       );
      1: (
        uResIdString: LongWord;
      );
  end;
  _DIACTION = _DIACTIONA;
  DIACTIONA = _DIACTIONA;
  DIACTION = DIACTIONA;
  TDIActionA = _DIACTIONA;
  TDIAction = TDIActionA;

  PDIActionFormatA = ^TDIActionFormatA;
  PDIActionFormat = PDIActionFormatA;
  _DIACTIONFORMATA = packed record
    dwSize        : DWORD;
    dwActionSize  : DWORD;
    dwDataSize    : DWORD;
    dwNumActions  : DWORD;
    rgoAction     : PDIActionA;
    guidActionMap : TGUID;
    dwGenre       : DWORD;
    dwBufferSize  : DWORD;
    lAxisMin      : Longint;
    lAxisMax      : Longint;
    hInstString   : THandle;
    ftTimeStamp   : TFileTime;
    dwCRC         : DWORD;
    tszActionMap  : array [0..MAX_PATH-1] of AnsiChar;
  end;
  _DIACTIONFORMAT = _DIACTIONFORMATA;
  DIACTIONFORMATA = _DIACTIONFORMATA;
  DIACTIONFORMAT = DIACTIONFORMATA;
  TDIActionFormatA = _DIACTIONFORMATA;
  TDIActionFormat = TDIActionFormatA;

  PDIDeviceImageInfoA = ^TDIDeviceImageInfoA;
  PDIDeviceImageInfo = PDIDeviceImageInfoA;
  _DIDEVICEIMAGEINFOA = packed record
    tszImagePath: array [0..MAX_PATH-1] of AnsiChar;
    dwFlags:         DWORD;
    dwViewID:        DWORD;
    rcOverlay:       TRect;
    dwObjID:         DWORD;
    dwcValidPts:     DWORD;
    rgptCalloutLine: array [0..4] of TPoint;
    rcCalloutRect:   TRect;
    dwTextAlign:     DWORD;
  end;
  _DIDEVICEIMAGEINFO = _DIDEVICEIMAGEINFOA;
  DIDEVICEIMAGEINFOA = _DIDEVICEIMAGEINFOA;
  DIDEVICEIMAGEINFO = DIDEVICEIMAGEINFOA;
  TDIDeviceImageInfoA = _DIDEVICEIMAGEINFOA;
  TDIDeviceImageInfo = TDIDeviceImageInfoA;

  PDIDeviceImageInfoHeaderA = ^TDIDeviceImageInfoHeaderA;
  PDIDeviceImageInfoHeader = PDIDeviceImageInfoHeaderA;
  _DIDEVICEIMAGEINFOHEADERA = packed record
    dwSize:             DWORD;
    dwSizeImageInfo:    DWORD;
    dwcViews:           DWORD;
    dwcButtons:         DWORD;
    dwcAxes:            DWORD;
    dwcPOVs:            DWORD;
    dwBufferSize:       DWORD;
    dwBufferUsed:       DWORD;
    lprgImageInfoArray: PDIDeviceImageInfoA;
  end;
  _DIDEVICEIMAGEINFOHEADER = _DIDEVICEIMAGEINFOHEADERA;
  DIDEVICEIMAGEINFOHEADERA = _DIDEVICEIMAGEINFOHEADERA;
  DIDEVICEIMAGEINFOHEADER = DIDEVICEIMAGEINFOHEADERA;
  TDIDeviceImageInfoHeaderA = _DIDEVICEIMAGEINFOHEADERA;
  TDIDeviceImageInfoHeader = TDIDeviceImageInfoHeaderA;

  IDirectInputDevice8A = interface(IDirectInputDevice7A)
    [SID_IDirectInputDevice8A]
    function BuildActionMap(out lpdiaf: TDIActionFormatA; lpszUserName: PAnsiChar; dwFlags: DWORD): HResult; stdcall;
    function SetActionMap(var lpdiActionFormat: TDIActionFormatA; lptszUserName: PAnsiChar; dwFlags: DWORD): HResult; stdcall;
    function GetImageInfo(var lpdiDevImageInfoHeader: TDIDeviceImageInfoHeaderA): HResult; stdcall;
  end;
  IDirectInputDevice8 = IDirectInputDevice8A;

  TDIEnumDevicesBySemanticsCallbackA = function (var lpddi: TDIDeviceInstanceA; lpdid: IDirectInputDevice8A; dwFlags, dwRemaining: DWORD; pvRef: Pointer): BOOL; stdcall;
  TDIConfigureDevicesCallback = function (lpDDSTarget: IUnknown; pvRef: Pointer): BOOL; stdcall;

  TD3DColor = DWORD;

  PDIColorSet = ^TDIColorSet;
  _DICOLORSET = packed record
    dwSize: DWORD;
    cTextFore: TD3DColor;
    cTextHighlight: TD3DColor;
    cCalloutLine: TD3DColor;
    cCalloutHighlight: TD3DColor;
    cBorder: TD3DColor;
    cControlFill: TD3DColor;
    cHighlightFill: TD3DColor;
    cAreaFill: TD3DColor;
  end;
  DICOLORSET = _DICOLORSET;
  TDIColorSet = _DICOLORSET;

  PDIConfigureDevicesParamsA = ^TDIConfigureDevicesParamsA;
  PDIConfigureDevicesParams = PDIConfigureDevicesParamsA;
  _DICONFIGUREDEVICESPARAMSA = packed record
     dwSize:         DWORD;
     dwcUsers:       DWORD;
     lptszUserNames: PAnsiChar;
     dwcFormats:     DWORD;
     lprgFormats:    PDIActionFormatA;
     hwnd:           HWND;
     dics:           TDIColorSet;
     lpUnkDDSTarget: IUnknown;
  end;
  _DICONFIGUREDEVICESPARAMS = _DICONFIGUREDEVICESPARAMSA;
  DICONFIGUREDEVICESPARAMSA = _DICONFIGUREDEVICESPARAMSA;
  DICONFIGUREDEVICESPARAMS = DICONFIGUREDEVICESPARAMSA;
  TDIConfigureDevicesParamsA = _DICONFIGUREDEVICESPARAMSA;
  TDIConfigureDevicesParams = TDIConfigureDevicesParamsA;

  IDirectInput8A = interface(IUnknown)
    [SID_IDirectInput8A]
    function CreateDevice(const rguid: TGUID; out lplpDirectInputDevice: IDirectInputDevice8A; pUnkOuter: IUnknown): HResult; stdcall;
    function EnumDevices(dwDevType: DWORD; lpCallback: TDIEnumDevicesCallbackA; pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetDeviceStatus(const rguidInstance: TGUID): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD): HResult; stdcall;
    function FindDevice(const rguidClass: TGUID; ptszName: PAnsiChar; out pguidInstance: TGUID): HResult; stdcall;
    function EnumDevicesBySemantics(ptszUserName: PAnsiChar; const lpdiActionFormat: TDIActionFormatA; lpCallback: TDIEnumDevicesBySemanticsCallbackA; pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function ConfigureDevices(lpdiCallback: TDIConfigureDevicesCallback; const lpdiCDParams: TDIConfigureDevicesParamsA; dwFlags: DWORD; pvRefData: Pointer): HResult; stdcall;
  end;

  IDirectInput8 = IDirectInput8A;
  IID_IDirectInput8 = IDirectInput8;

implementation

end.