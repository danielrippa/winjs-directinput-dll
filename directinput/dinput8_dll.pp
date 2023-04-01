unit dinput8_dll;

{$mode delphi}

interface

const

  dll = 'dinput8.dll';

  function DirectInput8Create(hinst: THandle; dwVersion: DWORD; const riidltf: TGUID; out ppvOut{: Pointer}; punkOuter: IUnknown): HResult; stdcall; external dll;

implementation

end.
