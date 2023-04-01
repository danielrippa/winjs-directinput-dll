unit directinput2Types;

{$mode delphi}

interface

uses directinputTypes, windows;

const

  SID_IDirectInputDevice2A = '{5944E682-C92E-11CF-BFC7-444553540000}';
  SID_IDirectInputEffect   = '{E7E1F7C0-88D2-11D0-9AD0-00A0C9A06E35}';

type

  PDIEnvelope = ^TDIEnvelope;
  DIENVELOPE = packed record
    dwSize: DWORD;                   (* sizeof(DIENVELOPE)   *)
    dwAttackLevel: DWORD;
    dwAttackTime: DWORD;             (* Microseconds         *)
    dwFadeLevel: DWORD;
    dwFadeTime: DWORD;               (* Microseconds         *)
  end;
  TDIEnvelope = DIENVELOPE;

  PDIEffect = ^TDIEffect;
  DIEFFECT = packed record
    dwSize: DWORD;                   (* sizeof(DIEFFECT)     *)
    dwFlags: DWORD;                  (* DIEFF_*              *)
    dwDuration: DWORD;               (* Microseconds         *)
    dwSamplePeriod: DWORD;           (* Microseconds         *)
    dwGain: DWORD;
    dwTriggerButton: DWORD;          (* or DIEB_NOTRIGGER    *)
    dwTriggerRepeatInterval: DWORD;  (* Microseconds         *)
    cAxes: DWORD;                    (* Number of axes       *)
    rgdwAxes: PDWORD;                (* Array of axes        *)
    rglDirection: PLongint;          (* Array of directions  *)
    lpEnvelope: PDIEnvelope;         (* Optional             *)
    cbTypeSpecificParams: DWORD;     (* Size of params       *)
    lpvTypeSpecificParams: Pointer;  (* Pointer to params    *)
  end;
  TDIEffect = DIEFFECT;

  PDIEffEscape = ^TDIEffEscape;
  DIEFFESCAPE = packed record
    dwSize: DWORD;
    dwCommand: DWORD;
    lpvInBuffer: Pointer;
    cbInBuffer: DWORD;
    lpvOutBuffer: Pointer;
    cbOutBuffer: DWORD;
  end;
  TDIEffEscape = DIEFFESCAPE;

  IDirectInputEffect = interface(IUnknown)
    [SID_IDirectInputEffect]
    function Initialize(hinst: THandle; dwVersion: DWORD; const rguid: TGUID): HResult; stdcall;
    function GetEffectGuid(out pguid: TGUID): HResult; stdcall;
    function GetParameters(var peff: TDIEffect; dwFlags: DWORD): HResult; stdcall;
    function SetParameters(const peff: TDIEffect; dwFlags: DWORD): HResult; stdcall;
    function Start(dwIterations, dwFlags: DWORD): HResult; stdcall;
    function Stop: HResult; stdcall;
    function GetEffectStatus(out pdwFlags: DWORD): HResult; stdcall;
    function Download: HResult; stdcall;
    function Unload: HResult; stdcall;
    function Escape(var pesc: PDIEffEscape): HResult; stdcall;
  end;

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

  TDIEnumEffectsCallbackA = function (var pdei: TDIEffectInfoA; pvRef: Pointer): BOOL; stdcall;

  TDIEnumCreatedEffectObjectsCallback = function (peff : IDirectInputEffect; pvRev: Pointer): BOOL; stdcall;

  IDirectInputDevice2A = interface(IDirectInputDeviceA)
    [SID_IDirectInputDevice2A]
    function CreateEffect(const rguid: TGUID; lpeff: PDIEffect; out ppdeff: IDirectInputEffect; punkOuter: IUnknown): HResult; stdcall;
    function EnumEffects(lpCallback: TDIEnumEffectsCallbackA; pvRef: Pointer; dwEffType: DWORD): HResult; stdcall;
    function GetEffectInfo(var pdei: TDIEffectInfoA; const rguid: TGUID): HResult; stdcall;
    function GetForceFeedbackState(out pdwOut: DWORD): HResult; stdcall;
    function SendForceFeedbackCommand(dwFlags: DWORD): HResult; stdcall;
    function EnumCreatedEffectObjects(lpCallback: TDIEnumCreatedEffectObjectsCallback; pvRef: Pointer; fl: DWORD): HResult; stdcall;
    function Escape(var pesc: TDIEffEscape): HResult; stdcall;
    function Poll: HResult; stdcall;
    function SendDeviceData(cbObjectData: DWORD; rgdod: PDIDeviceObjectData; var pdwInOut: DWORD; fl: DWORD): HResult; stdcall;
  end;

implementation

end.