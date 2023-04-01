unit DirectInput7Types;

{$mode delphi}

interface

uses

  windows, directinput2Types;

const

  SID_IDirectInputDevice7A = '{57D7C6BC-2356-11D3-8E9D-00C04F6844AE}';

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

  PDIFileEffect = ^TDIFileEffect;
  DIFILEEFFECT = packed record
    dwSize: DWORD;
    GuidEffect: TGUID;
    lpDiEffect: PDIEffect;
    szFriendlyName: array [0..MAX_PATH-1] of Char;
  end;
  TDIFileEffect = DIFILEEFFECT;

  TDIEnumEffectsInFileCallback = function (const Effect: TDIFileEffect; Data: Pointer): BOOL; stdcall;

  IDirectInputDevice7A = interface(IDirectInputDevice2A)
    [SID_IDirectInputDevice7A]
    function EnumEffectsInFile(lpszFileName: PAnsiChar; pec: TDIEnumEffectsInFileCallback; pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function WriteEffectToFile(lpszFileName: PAnsiChar; dwEntries: DWORD; rgDiFileEft: PDIFileEffect; dwFlags: DWORD): HResult; stdcall;
  end;

implementation

end.
