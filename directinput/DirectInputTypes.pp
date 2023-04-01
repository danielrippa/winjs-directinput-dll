unit DirectInputTypes;

{$mode delphi}

interface

uses windows;

const

  SID_IDirectInputDeviceA = '{5944E680-C92E-11CF-BFC7-444553540000}';

  GUID_SysMouse: TGUID = '{6F1D2B60-D5A0-11CF-BFC7-444553540000}';
  GUID_SysKeyboard: TGUID = '{6F1D2B61-D5A0-11CF-BFC7-444553540000}';
  GUID_Joystick: TGUID = '{6F1D2B70-D5A0-11CF-BFC7-444553540000}';

  DIDF_ABSAXIS = $00000001;
  DIDF_RELAXIS = $00000002;

  DISCL_EXCLUSIVE    = $00000001;
  DISCL_NONEXCLUSIVE = $00000002;
  DISCL_FOREGROUND   = $00000004;
  DISCL_BACKGROUND   = $00000008;
  DISCL_NOWINKEY     = $00000010;

  DIPH_DEVICE   = 0;
  DIPH_BYOFFSET = 1;
  DIPH_BYID     = 2;
  DIPH_BYUSAGE  = 3;

  DI_OK                           = S_OK;
  DI_NOTATTACHED                  = S_FALSE;
  DI_BUFFEROVERFLOW               = S_FALSE;
  DI_PROPNOEFFECT                 = S_FALSE;
  DI_NOEFFECT                     = S_FALSE;

  DI_POLLEDDEVICE                 = HRESULT($00000002);
  DI_DOWNLOADSKIPPED              = HRESULT($00000003);
  DI_EFFECTRESTARTED              = HRESULT($00000004);
  DI_TRUNCATED                    = HRESULT($00000008);
  DI_SETTINGSNOTSAVED             = HRESULT($0000000B);
  DI_TRUNCATEDANDRESTARTED        = HRESULT($0000000C);
  DI_WRITEPROTECT                 = HRESULT($00000013);

  SEVERITY_ERROR_FACILITY_WIN32 = HResult(SEVERITY_ERROR shl 31) or HResult(FACILITY_WIN32 shl 16);

  DIERR_OLDDIRECTINPUTVERSION = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_OLD_WIN_VERSION);
  DIERR_BETADIRECTINPUTVERSION = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_RMODE_APP);
  DIERR_BADDRIVERVER = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_BAD_DRIVER_LEVEL);
  DIERR_DEVICENOTREG = REGDB_E_CLASSNOTREG;
  DIERR_NOTFOUND = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_FILE_NOT_FOUND);
  DIERR_OBJECTNOTFOUND = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_FILE_NOT_FOUND);
  DIERR_INVALIDPARAM = E_INVALIDARG;
  DIERR_NOINTERFACE = E_NOINTERFACE;
  DIERR_GENERIC = E_FAIL;
  DIERR_OUTOFMEMORY = E_OUTOFMEMORY;
  DIERR_UNSUPPORTED = E_NOTIMPL;
  DIERR_NOTINITIALIZED = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_NOT_READY);
  DIERR_ALREADYINITIALIZED = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_ALREADY_INITIALIZED);
  DIERR_NOAGGREGATION = CLASS_E_NOAGGREGATION;
  DIERR_OTHERAPPHASPRIO = E_ACCESSDENIED;
  DIERR_INPUTLOST = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_READ_FAULT);
  DIERR_ACQUIRED = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_BUSY);
  DIERR_NOTACQUIRED = HRESULT(SEVERITY_ERROR_FACILITY_WIN32 or ERROR_INVALID_ACCESS);
  DIERR_READONLY = E_ACCESSDENIED;
  DIERR_HANDLEEXISTS = E_ACCESSDENIED;

  E_PENDING                       = $8000000A;
  DIERR_INSUFFICIENTPRIVS         = $80040200;
  DIERR_DEVICEFULL                = $80040201;
  DIERR_MOREDATA                  = $80040202;
  DIERR_NOTDOWNLOADED             = $80040203;
  DIERR_HASEFFECTS                = $80040204;
  DIERR_NOTEXCLUSIVEACQUIRED      = $80040205;
  DIERR_INCOMPLETEEFFECT          = $80040206;
  DIERR_NOTBUFFERED               = $80040207;
  DIERR_EFFECTPLAYING             = $80040208;
  DIERR_UNPLUGGED                 = $80040209;
  DIERR_REPORTFULL                = $8004020A;
  DIERR_MAPFILEFAIL               = $8004020B;

  DIDEVTYPE_DEVICE   = 1;
  DIDEVTYPE_MOUSE    = 2;
  DIDEVTYPE_KEYBOARD = 3;
  DIDEVTYPE_JOYSTICK = 4;

  DI8DEVCLASS_ALL      = 0;
  DI8DEVCLASS_DEVICE   = 1;
  DI8DEVCLASS_POINTER  = 2;
  DI8DEVCLASS_KEYBOARD = 3;
  DI8DEVCLASS_GAMECTRL = 4;

  DI8DEVTYPE_DEVICE        = $11;
  DI8DEVTYPE_MOUSE         = $12;
  DI8DEVTYPE_KEYBOARD      = $13;
  DI8DEVTYPE_JOYSTICK      = $14;
  DI8DEVTYPE_GAMEPAD       = $15;
  DI8DEVTYPE_DRIVING       = $16;
  DI8DEVTYPE_FLIGHT        = $17;
  DI8DEVTYPE_1STPERSON     = $18;
  DI8DEVTYPE_DEVICECTRL    = $19;
  DI8DEVTYPE_SCREENPOINTER = $1A;
  DI8DEVTYPE_REMOTE        = $1B;
  DI8DEVTYPE_SUPPLEMENTAL  = $1C;

  DIEDFL_ALLDEVICES       = $00000000;
  DIEDFL_ATTACHEDONLY     = $00000001;
  DIEDFL_FORCEFEEDBACK    = $00000100;
  DIEDFL_INCLUDEALIASES   = $00010000;
  DIEDFL_INCLUDEPHANTOMS  = $00020000;
  DIEDFL_INCLUDEHIDDEN    = $00040000;

type

  PDIJoyState2 = ^TDIJoyState2;
  DIJOYSTATE2 = packed record
    lX: Longint;
    lY: Longint;
    lZ: Longint;
    lRx: Longint;
    lRy: Longint;
    lRz: Longint;
    rglSlider: array[0..1] of Longint;
    rgdwPOV: array[0..3] of DWORD;
    rgbButtons: array[0..127] of Byte;
    lVX: Longint;
    lVY: Longint;
    lVZ: Longint;
    lVRx: Longint;
    lVRy: Longint;
    lVRz: Longint;
    rglVSlider: array[0..1] of Longint;
    lAX: Longint;
    lAY: Longint;
    lAZ: Longint;
    lARx: Longint;
    lARy: Longint;
    lARz: Longint;
    rglASlider: array[0..1] of Longint;
    lFX: Longint;
    lFY: Longint;
    lFZ: Longint;
    lFRx: Longint;
    lFRy: Longint;
    lFRz: Longint;
    rglFSlider: array[0..1] of Longint;
  end;
  TDIJoyState2 = DIJOYSTATE2;

  MAKEDIPROP = PGUID;

  PDIDevCaps = ^TDIDevCaps;
  DIDEVCAPS = packed record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwDevType: DWORD;
    dwAxes: DWORD;
    dwButtons: DWORD;
    dwPOVs: DWORD;
    dwFFSamplePeriod: DWORD;
    dwFFMinTimeResolution: DWORD;
    dwFirmwareRevision: DWORD;
    dwHardwareRevision: DWORD;
    dwFFDriverVersion: DWORD;
  end;
  TDIDevCaps = DIDEVCAPS;

  PDIDeviceInstanceA = ^TDIDeviceInstanceA;
  PDIDeviceInstance = PDIDeviceInstanceA;
  DIDEVICEINSTANCEA = packed record
    dwSize: DWORD;
    guidInstance: TGUID;
    guidProduct: TGUID;
    dwDevType: DWORD;
    tszInstanceName: array[0..MAX_PATH-1] of AnsiChar;
    tszProductName: array[0..MAX_PATH-1] of AnsiChar;
    guidFFDriver: TGUID;
    wUsagePage: Word;
    wUsage: Word;
  end;
  DIDEVICEINSTANCE = DIDEVICEINSTANCEA;
  TDIDeviceInstanceA = DIDEVICEINSTANCEA;

  DIDEVICEOBJECTINSTANCEA = packed record
    dwSize: DWORD;
    guidType: TGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    tszName: array[0..MAX_PATH-1] of AnsiChar;
    dwFFMaxForce: DWORD;
    dwFFForceResolution: DWORD;
    wCollectionNumber: Word;
    wDesignatorIndex: Word;
    wUsagePage: Word;
    wUsage: Word;
    dwDimension: DWORD;
    wExponent: Word;
    wReportId: Word;
  end;
  TDIDeviceObjectInstanceA = DIDEVICEOBJECTINSTANCEA;
  TDIDeviceObjectInstance = TDIDeviceObjectInstanceA;

const

  DIENUM_STOP     = BOOL(0);
  DIENUM_CONTINUE = BOOL(1);

type

  TDIEnumDeviceObjectsCallbackA = function (var lpddoi: TDIDeviceObjectInstanceA; pvRef : Pointer): BOOL; stdcall;

  PDIPropHeader = ^TDIPropHeader;
  DIPROPHEADER = packed record
    dwSize: DWORD;
    dwHeaderSize: DWORD;
    dwObj: DWORD;
    dwHow: DWORD;
  end;
  TDIPropHeader = DIPROPHEADER;

  PDIPropRange = ^TDIPropRange;
  DIPROPRANGE = packed record
    diph: TDIPropHeader;
    lMin: Longint;
    lMax: Longint;
  end;
  TDIPropRange = DIPROPRANGE;

  PDIPropDWord = ^TDIPropDWord;
  DIPROPDWORD = packed record
    diph: TDIPropHeader;
    dwData: DWORD;
  end;
  TDIPropDWord = DIPROPDWORD;

  PDIDeviceObjectData = ^TDIDeviceObjectData;
  DIDEVICEOBJECTDATA = packed record
    dwOfs: DWORD;
    dwData: DWORD;
    dwTimeStamp: DWORD;
    dwSequence: DWORD;
    uAppData: Pointer;
  end;
  TDIDeviceObjectData = DIDEVICEOBJECTDATA;

  PDIObjectDataFormat = ^TDIObjectDataFormat;
  _DIOBJECTDATAFORMAT = packed record
    pguid: PGUID;
    dwOfs: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
  end;
  DIOBJECTDATAFORMAT = _DIOBJECTDATAFORMAT;
  TDIObjectDataFormat = _DIOBJECTDATAFORMAT;

  PDIDataFormat = ^TDIDataFormat;
  _DIDATAFORMAT = packed record
    dwSize: DWORD;
    dwObjSize: DWORD;
    dwFlags: DWORD;
    dwDataSize: DWORD;
    dwNumObjs: DWORD;
    rgodf: PDIObjectDataFormat;
  end;
  DIDATAFORMAT = _DIDATAFORMAT;
  TDIDataFormat = _DIDATAFORMAT;

  PDIMouseState = ^TDIMouseState;
  _DIMOUSESTATE = packed record
    lX: Longint;
    lY: Longint;
    lZ: Longint;
    rgbButtons: array[0..3] of Byte;
  end;
  DIMOUSESTATE = _DIMOUSESTATE;
  TDIMouseState = _DIMOUSESTATE;

const

  DIPROP_BUFFERSIZE         = MAKEDIPROP(1);
  DIPROP_AXISMODE           = MAKEDIPROP(2);
  DIPROP_GRANULARITY        = MAKEDIPROP(3);
  DIPROP_RANGE              = MAKEDIPROP(4);
  DIPROP_DEADZONE           = MAKEDIPROP(5);
  DIPROP_SATURATION         = MAKEDIPROP(6);
  DIPROP_FFGAIN             = MAKEDIPROP(7);
  DIPROP_FFLOAD             = MAKEDIPROP(8);
  DIPROP_AUTOCENTER         = MAKEDIPROP(9);
  DIPROP_CALIBRATIONMODE    = MAKEDIPROP(10);
  DIPROP_CALIBRATION        = MAKEDIPROP(11);
  DIPROP_GUIDANDPATH        = MAKEDIPROP(12);
  DIPROP_INSTANCENAME       = MAKEDIPROP(13);
  DIPROP_PRODUCTNAME        = MAKEDIPROP(14);
  DIPROP_JOYSTICKID         = MAKEDIPROP(15);
  DIPROP_GETPORTDISPLAYNAME = MAKEDIPROP(16);
  DIPROP_PHYSICALRANGE      = MAKEDIPROP(18);
  DIPROP_LOGICALRANGE       = MAKEDIPROP(19);
  DIPROP_KEYNAME            = MAKEDIPROP(20);
  DIPROP_CPOINTS            = MAKEDIPROP(21);
  DIPROP_APPDATA            = MAKEDIPROP(22);
  DIPROP_SCANCODE           = MAKEDIPROP(23);
  DIPROP_VIDPID             = MAKEDIPROP(24);
  DIPROP_USERNAME           = MAKEDIPROP(25);
  DIPROP_TYPENAME           = MAKEDIPROP(26);

  DIPROPAXISMODE_ABS = 0;
  DIPROPAXISMODE_REL = 1;

  DIPROPAUTOCENTER_OFF = 0;
  DIPROPAUTOCENTER_ON  = 1;

  DIPROPCALIBRATIONMODE_COOKED = 0;
  DIPROPCALIBRATIONMODE_RAW    = 1;

  GUID_Button  : TGUID = '{A36D02F0-C9F3-11CF-BFC7-444553540000}';
  GUID_Key     : TGUID = '{55728220-D33C-11CF-BFC7-444553540000}';
  GUID_POV     : TGUID = '{A36D02F2-C9F3-11CF-BFC7-444553540000}';
  GUID_Unknown : TGUID = '{A36D02F3-C9F3-11CF-BFC7-444553540000}';

  DIDFT_ALL           = $00000000;

  DIDFT_RELAXIS = $00000001;
  DIDFT_ABSAXIS = $00000002;
  DIDFT_AXIS    = $00000003;

  DIDFT_PSHBUTTON = $00000004;
  DIDFT_TGLBUTTON = $00000008;
  DIDFT_BUTTON    = $0000000C;

  DIDFT_POV        = $00000010;
  DIDFT_COLLECTION = $00000040;
  DIDFT_NODATA     = $00000080;

  DIDFT_ANYINSTANCE  = $00FFFF00;
  DIDFT_INSTANCEMASK = DIDFT_ANYINSTANCE;

  DIPROPRANGE_NOMIN = $80000000;
  DIPROPRANGE_NOMAX = $7FFFFFFF;

  rgodfKeyboard: array[0..255] of TDIObjectDataFormat = (
    (pguid: @GUID_Key; dwOfs:   0; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  0 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   1; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  1 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   2; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  2 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   3; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  3 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   4; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  4 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   5; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  5 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   6; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  6 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   7; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  7 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   8; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  8 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:   9; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (  9 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  10; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 10 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  11; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 11 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  12; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 12 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  13; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 13 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  14; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 14 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  15; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 15 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  16; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 16 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  17; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 17 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  18; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 18 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  19; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 19 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  20; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 20 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  21; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 21 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  22; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 22 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  23; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 23 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  24; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 24 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  25; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 25 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  26; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 26 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  27; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 27 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  28; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 28 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  29; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 29 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  30; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 30 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  31; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 31 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  32; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 32 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  33; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 33 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  34; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 34 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  35; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 35 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  36; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 36 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  37; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 37 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  38; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 38 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  39; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 39 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  40; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 40 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  41; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 41 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  42; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 42 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  43; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 43 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  44; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 44 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  45; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 45 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  46; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 46 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  47; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 47 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  48; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 48 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  49; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 49 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  50; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 50 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  51; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 51 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  52; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 52 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  53; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 53 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  54; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 54 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  55; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 55 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  56; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 56 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  57; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 57 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  58; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 58 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  59; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 59 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  60; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 60 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  61; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 61 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  62; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 62 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  63; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 63 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  64; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 64 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  65; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 65 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  66; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 66 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  67; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 67 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  68; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 68 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  69; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 69 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  70; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 70 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  71; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 71 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  72; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 72 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  73; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 73 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  74; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 74 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  75; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 75 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  76; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 76 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  77; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 77 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  78; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 78 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  79; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 79 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  80; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 80 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  81; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 81 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  82; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 82 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  83; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 83 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  84; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 84 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  85; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 85 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  86; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 86 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  87; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 87 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  88; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 88 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  89; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 89 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  90; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 90 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  91; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 91 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  92; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 92 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  93; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 93 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  94; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 94 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  95; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 95 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  96; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 96 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  97; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 97 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  98; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 98 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs:  99; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or ( 99 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 100; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (100 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 101; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (101 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 102; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (102 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 103; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (103 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 104; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (104 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 105; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (105 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 106; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (106 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 107; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (107 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 108; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (108 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 109; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (109 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 110; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (110 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 111; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (111 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 112; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (112 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 113; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (113 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 114; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (114 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 115; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (115 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 116; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (116 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 117; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (117 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 118; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (118 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 119; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (119 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 120; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (120 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 121; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (121 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 122; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (122 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 123; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (123 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 124; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (124 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 125; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (125 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 126; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (126 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 127; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (127 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 128; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (128 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 129; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (129 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 130; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (130 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 131; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (131 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 132; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (132 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 133; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (133 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 134; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (134 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 135; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (135 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 136; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (136 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 137; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (137 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 138; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (138 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 139; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (139 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 140; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (140 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 141; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (141 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 142; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (142 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 143; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (143 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 144; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (144 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 145; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (145 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 146; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (146 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 147; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (147 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 148; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (148 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 149; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (149 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 150; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (150 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 151; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (151 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 152; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (152 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 153; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (153 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 154; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (154 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 155; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (155 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 156; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (156 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 157; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (157 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 158; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (158 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 159; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (159 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 160; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (160 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 161; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (161 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 162; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (162 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 163; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (163 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 164; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (164 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 165; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (165 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 166; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (166 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 167; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (167 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 168; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (168 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 169; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (169 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 170; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (170 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 171; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (171 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 172; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (172 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 173; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (173 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 174; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (174 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 175; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (175 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 176; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (176 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 177; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (177 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 178; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (178 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 179; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (179 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 180; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (180 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 181; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (181 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 182; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (182 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 183; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (183 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 184; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (184 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 185; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (185 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 186; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (186 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 187; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (187 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 188; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (188 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 189; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (189 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 190; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (190 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 191; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (191 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 192; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (192 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 193; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (193 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 194; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (194 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 195; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (195 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 196; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (196 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 197; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (197 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 198; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (198 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 199; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (199 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 200; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (200 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 201; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (201 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 202; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (202 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 203; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (203 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 204; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (204 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 205; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (205 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 206; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (206 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 207; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (207 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 208; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (208 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 209; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (209 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 210; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (210 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 211; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (211 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 212; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (212 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 213; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (213 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 214; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (214 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 215; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (215 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 216; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (216 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 217; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (217 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 218; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (218 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 219; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (219 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 220; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (220 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 221; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (221 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 222; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (222 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 223; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (223 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 224; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (224 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 225; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (225 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 226; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (226 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 227; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (227 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 228; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (228 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 229; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (229 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 230; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (230 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 231; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (231 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 232; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (232 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 233; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (233 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 234; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (234 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 235; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (235 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 236; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (236 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 237; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (237 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 238; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (238 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 239; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (239 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 240; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (240 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 241; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (241 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 242; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (242 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 243; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (243 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 244; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (244 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 245; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (245 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 246; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (246 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 247; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (247 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 248; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (248 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 249; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (249 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 250; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (250 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 251; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (251 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 252; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (252 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 253; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (253 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 254; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (254 shl 8); dwFlags: 0),
    (pguid: @GUID_Key; dwOfs: 255; dwType: DIDFT_BUTTON or DIPROPRANGE_NOMIN or (255 shl 8); dwFlags: 0)
  );

  c_dfDIKeyboard: TDIDataFormat = (
    dwSize     : Sizeof(c_dfDIKeyboard);
    dwObjSize  : Sizeof(TDIObjectDataFormat);
    dwFlags    : DIDF_RELAXIS;
    dwDataSize : 256;
    dwNumObjs  : High(rgodfKeyboard) + 1;
    rgodf      : @rgodfKeyboard
  );

  GUID_XAxis: TGUID = '{A36D02E0-C9F3-11CF-BFC7-444553540000}';
  GUID_YAxis: TGUID = '{A36D02E1-C9F3-11CF-BFC7-444553540000}';
  GUID_ZAxis: TGUID = '{A36D02E2-C9F3-11CF-BFC7-444553540000}';
  GUID_RxAxis: TGUID = '{A36D02F4-C9F3-11CF-BFC7-444553540000}';
  GUID_RyAxis: TGUID = '{A36D02F5-C9F3-11CF-BFC7-444553540000}';
  GUID_RzAxis: TGUID = '{A36D02E3-C9F3-11CF-BFC7-444553540000}';
  GUID_Slider: TGUID = '{A36D02E4-C9F3-11CF-BFC7-444553540000}';

  DIMOFS_X        = 0; // FIELD_OFFSET(DIMOUSESTATE, lX)
  DIMOFS_Y        = 4; // FIELD_OFFSET(DIMOUSESTATE, lY)
  DIMOFS_Z        = 8; // FIELD_OFFSET(DIMOUSESTATE, lZ)

  DIMOFS_BUTTON0  = 12;
  DIMOFS_BUTTON1  = DIMOFS_BUTTON0 + 1;
  DIMOFS_BUTTON2  = DIMOFS_BUTTON0 + 2;
  DIMOFS_BUTTON3  = DIMOFS_BUTTON0 + 3;
  DIMOFS_BUTTON4  = DIMOFS_BUTTON0 + 4;
  DIMOFS_BUTTON5  = DIMOFS_BUTTON0 + 5;
  DIMOFS_BUTTON6  = DIMOFS_BUTTON0 + 6;
  DIMOFS_BUTTON7  = DIMOFS_BUTTON0 + 7;

  rgodfDIMouse: array[0..6] of TDIObjectDataFormat = (
    (pguid: @GUID_XAxis; dwOfs: DIMOFS_X; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE; dwFlags: 0),
    (pguid: @GUID_YAxis; dwOfs: DIMOFS_Y; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE; dwFlags: 0),
    (pguid: @GUID_ZAxis; dwOfs: DIMOFS_Z; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIMOFS_BUTTON0;   dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE; dwFlags: 0),
    (pguid: nil; dwOfs: DIMOFS_BUTTON1;   dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE; dwFlags: 0),
    (pguid: nil; dwOfs: DIMOFS_BUTTON2;   dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIMOFS_BUTTON3;   dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0)
  );

  c_dfDIMouse: TDIDataFormat = (
    dwSize: Sizeof(c_dfDIMouse);
    dwObjSize: Sizeof(TDIObjectDataFormat);
    dwFlags: DIDF_RELAXIS;
    dwDataSize: Sizeof(TDIMouseState);
    dwNumObjs: High(rgodfDIMouse) + 1;
    rgodf: @rgodfDIMouse
  );

  DIJOFS_X  = 0;
  DIJOFS_Y  = 4;
  DIJOFS_Z  = 8;
  DIJOFS_RX = 12;
  DIJOFS_RY = 16;
  DIJOFS_RZ = 20;

  DIDOI_FFACTUATOR      = $00000001;
  DIDOI_FFEFFECTTRIGGER = $00000002;
  DIDOI_POLLED          = $00008000;
  DIDOI_ASPECTPOSITION  = $00000100;
  DIDOI_ASPECTVELOCITY  = $00000200;
  DIDOI_ASPECTACCEL     = $00000300;
  DIDOI_ASPECTFORCE     = $00000400;
  DIDOI_ASPECTMASK      = $00000F00;
  DIDOI_GUIDISUSAGE     = $00010000;

  DIJOFS_BUTTON_      = 48;

  DIJOFS_BUTTON0      = DIJOFS_BUTTON_ +  0;
  DIJOFS_BUTTON1      = DIJOFS_BUTTON_ +  1;
  DIJOFS_BUTTON2      = DIJOFS_BUTTON_ +  2;
  DIJOFS_BUTTON3      = DIJOFS_BUTTON_ +  3;
  DIJOFS_BUTTON4      = DIJOFS_BUTTON_ +  4;
  DIJOFS_BUTTON5      = DIJOFS_BUTTON_ +  5;
  DIJOFS_BUTTON6      = DIJOFS_BUTTON_ +  6;
  DIJOFS_BUTTON7      = DIJOFS_BUTTON_ +  7;
  DIJOFS_BUTTON8      = DIJOFS_BUTTON_ +  8;
  DIJOFS_BUTTON9      = DIJOFS_BUTTON_ +  9;
  DIJOFS_BUTTON10     = DIJOFS_BUTTON_ + 10;
  DIJOFS_BUTTON11     = DIJOFS_BUTTON_ + 11;
  DIJOFS_BUTTON12     = DIJOFS_BUTTON_ + 12;
  DIJOFS_BUTTON13     = DIJOFS_BUTTON_ + 13;
  DIJOFS_BUTTON14     = DIJOFS_BUTTON_ + 14;
  DIJOFS_BUTTON15     = DIJOFS_BUTTON_ + 15;
  DIJOFS_BUTTON16     = DIJOFS_BUTTON_ + 16;
  DIJOFS_BUTTON17     = DIJOFS_BUTTON_ + 17;
  DIJOFS_BUTTON18     = DIJOFS_BUTTON_ + 18;
  DIJOFS_BUTTON19     = DIJOFS_BUTTON_ + 19;
  DIJOFS_BUTTON20     = DIJOFS_BUTTON_ + 20;
  DIJOFS_BUTTON21     = DIJOFS_BUTTON_ + 21;
  DIJOFS_BUTTON22     = DIJOFS_BUTTON_ + 22;
  DIJOFS_BUTTON23     = DIJOFS_BUTTON_ + 23;
  DIJOFS_BUTTON24     = DIJOFS_BUTTON_ + 24;
  DIJOFS_BUTTON25     = DIJOFS_BUTTON_ + 25;
  DIJOFS_BUTTON26     = DIJOFS_BUTTON_ + 26;
  DIJOFS_BUTTON27     = DIJOFS_BUTTON_ + 27;
  DIJOFS_BUTTON28     = DIJOFS_BUTTON_ + 28;
  DIJOFS_BUTTON29     = DIJOFS_BUTTON_ + 29;
  DIJOFS_BUTTON30     = DIJOFS_BUTTON_ + 30;
  DIJOFS_BUTTON31     = DIJOFS_BUTTON_ + 31;

  rgodfJoystick2: array[0..163] of TDIObjectDataFormat = (
    (pguid: @GUID_XAxis;  dwOfs: DIJOFS_X;  dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_YAxis;  dwOfs: DIJOFS_Y;  dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_ZAxis;  dwOfs: DIJOFS_Z;  dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_RxAxis; dwOfs: DIJOFS_RX; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_RyAxis; dwOfs: DIJOFS_RY; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_RzAxis; dwOfs: DIJOFS_RZ; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    // 2 Sliders
    (pguid: @GUID_Slider; dwOfs: 24; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    (pguid: @GUID_Slider; dwOfs: 28; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTPOSITION),
    // 4 POVs (yes, really)
    (pguid: @GUID_POV; dwOfs: 32; dwType: DIDFT_POV or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: @GUID_POV; dwOfs: 36; dwType: DIDFT_POV or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: @GUID_POV; dwOfs: 40; dwType: DIDFT_POV or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: @GUID_POV; dwOfs: 44; dwType: DIDFT_POV or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    // Buttons
    (pguid: nil; dwOfs: DIJOFS_BUTTON0;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON1;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON2;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON3;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON4;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON5;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON6;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON7;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON8;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON9;  dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON10; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON11; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON12; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON13; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON14; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON15; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON16; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON17; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON18; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON19; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON20; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON21; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON22; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON23; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON24; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON25; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON26; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON27; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON28; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON29; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON30; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs: DIJOFS_BUTTON31; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: 0),
    (pguid: nil; dwOfs:  80; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  81; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  82; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  83; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  84; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  85; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  86; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  87; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  88; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  89; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  90; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  91; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  92; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  93; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  94; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  95; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  96; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  97; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  98; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs:  99; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 100; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 101; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 102; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 103; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 104; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 105; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 106; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 107; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 108; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 109; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 110; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 111; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 112; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 113; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 114; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 115; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 116; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 117; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 118; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 119; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 120; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 121; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 122; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 123; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 124; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 125; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 126; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 127; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 128; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 129; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 130; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 131; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 132; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 133; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 134; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 135; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 136; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 137; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 138; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 139; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 140; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 141; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 142; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 143; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 144; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 145; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 146; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 147; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 148; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 149; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 150; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 151; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 152; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 153; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 154; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 155; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 156; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 157; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 158; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 159; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 160; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 161; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 162; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 163; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 164; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 165; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 166; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 167; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 168; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 169; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 170; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 171; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 172; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 173; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 174; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: nil; dwOfs: 175; dwType: DIDFT_BUTTON or DIDFT_ANYINSTANCE or $80000000; dwFlags: $0),
    (pguid: @GUID_XAxis;  dwOfs: 176; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_YAxis;  dwOfs: 180; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_ZAxis;  dwOfs: 184; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_RxAxis; dwOfs: 188; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_RyAxis; dwOfs: 192; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_RzAxis; dwOfs: 196; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_Slider; dwOfs:  24; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_Slider; dwOfs:  28; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTVELOCITY),
    (pguid: @GUID_XAxis;  dwOfs: 208; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_YAxis;  dwOfs: 212; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_ZAxis;  dwOfs: 216; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_RxAxis; dwOfs: 220; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_RyAxis; dwOfs: 224; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_RzAxis; dwOfs: 228; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_Slider; dwOfs:  24; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_Slider; dwOfs:  28; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTACCEL),
    (pguid: @GUID_XAxis;  dwOfs: 240; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_YAxis;  dwOfs: 244; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_ZAxis;  dwOfs: 248; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_RxAxis; dwOfs: 252; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_RyAxis; dwOfs: 256; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_RzAxis; dwOfs: 260; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_Slider; dwOfs:  24; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE),
    (pguid: @GUID_Slider; dwOfs:  28; dwType: DIDFT_AXIS or DIDFT_ANYINSTANCE or $80000000; dwFlags: DIDOI_ASPECTFORCE)
  );



  c_dfDIJoystick2: TDIDataFormat = (
    dwSize     : Sizeof(c_dfDIJoystick2);
    dwObjSize  : Sizeof(TDIObjectDataFormat);
    dwFlags    : DIDF_ABSAXIS;
    dwDataSize : SizeOf(TDIJoyState2);
    dwNumObjs  : High(rgodfJoystick2) + 1;
    rgodf      : @rgodfJoystick2
  );

type

  IDirectInputDeviceA = interface(IUnknown)
    [SID_IDirectInputDeviceA]
    function GetCapabilities(var lpDIDevCaps: TDIDevCaps): HResult; stdcall;
    function EnumObjects(lpCallback: TDIEnumDeviceObjectsCallbackA; pvRef: Pointer; dwFlags: DWORD): HResult; stdcall;
    function GetProperty(rguidProp: PGUID; var pdiph: TDIPropHeader): HResult; stdcall;
    function SetProperty(rguidProp: PGUID; const pdiph: TDIPropHeader): HResult; stdcall;
    function Acquire: HResult; stdcall;
    function Unacquire: HResult; stdcall;
    function GetDeviceState(cbData: DWORD; lpvData: Pointer): HResult; stdcall;
    function GetDeviceData(cbObjectData: DWORD; rgdod: PDIDeviceObjectData; out pdwInOut: DWORD; dwFlags: DWORD): HResult; stdcall;
    function SetDataFormat(const lpdf: TDIDataFormat): HResult; stdcall;
    function SetEventNotification(hEvent: THandle): HResult; stdcall;
    function SetCooperativeLevel(hwnd: HWND; dwFlags: DWORD): HResult; stdcall;
    function GetObjectInfo(var pdidoi: TDIDeviceObjectInstanceA; dwObj, dwHow: DWORD): HResult; stdcall;
    function GetDeviceInfo(var pdidi: TDIDeviceInstanceA): HResult; stdcall;
    function RunControlPanel(hwndOwner: HWND; dwFlags: DWORD): HResult; stdcall;
    function Initialize(hinst: THandle; dwVersion: DWORD; const rguid: TGUID): HResult; stdcall;
  end;

implementation

end.