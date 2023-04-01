unit DirectInputManager;

{$mode delphi}

interface

uses

  DirectInputTypes, DirectInput8Types, Windows, DirectInputDevices;

type

  TDirectInputManager = record
    private
      FWindowHandle: THandle;
      FProperlyInitialized: Boolean;
      FDirectInput8: IDirectInput8;

      FKeyboard: TDirectInputKeyboard;
      FMouse: TDirectInputMouse;

      FJoysticks: array of TDirectInputJoystick;

      function CreateDirectInputDevice(DeviceType: TGUID): IDirectInputDevice8;

      procedure CreateKeyboard;
      procedure CreateMouse;

      function CreateJoystick(ddi: PDIDeviceInstance): TDirectInputJoystick;
      function GetJoystickCount: Integer;

      function GetJoystick(Index: Integer): TDirectInputJoystick;

      procedure ReleaseJoysticks;

      procedure Initialize;
      procedure Finalize;
    public
      property Keyboard: TDirectInputKeyboard read FKeyboard;
      property Mouse: TDirectInputMouse read FMouse;
      property JoystickCount: Integer read GetJoystickCount;

      property Joysticks[Index: Integer]: TDirectInputJoystick read GetJoystick;
      procedure EnumerateJoysticks;

      function JoystickButtonIsPressed(Button: Integer; Joystick: Integer): Boolean;
      function JoystickButtonWasPressed(Button: Integer; Joystick: Integer): Boolean;
      function JoystickButtonWasReleased(Button: Integer; Joystick: Integer): Boolean;

      procedure UpdateJoystick(Index: Integer);
  end;

var

  InputManager: TDirectInputManager;

implementation

  uses

    dinput8_dll, SysUtils;

  procedure TDirectInputManager.CreateKeyboard;
  var
    Device: IDirectInputDevice8;
  begin
    Device := CreateDirectInputDevice(GUID_SysKeyboard);
    if Device = Nil then Exit;
    if not Succeeded(Device.SetDataFormat(c_dfDIKeyboard)) then Exit;
    // if not Succeeded(Device.SetCooperativeLevel(FWindowHandle, DISCL_FOREGROUND or DISCL_NONEXCLUSIVE)) then Exit;
    Fkeyboard := TDirectInputKeyboard.Create(Device);
  end;

  procedure TDirectInputManager.CreateMouse;
  var
    Device: IDirectInputDevice8;
  begin
    Device := CreateDirectInputDevice(GUID_SysMouse);
    if Device = Nil then Exit;
    if not Succeeded(Device.SetDataFormat(c_dfDIMouse)) then Exit;
    // if not Succeeded(Device.SetCooperativeLevel(FWindowHandle, DISCL_FOREGROUND or DISCL_NONEXCLUSIVE)) then Exit;
    FMouse := TDirectInputMouse.Create(Device);
    FMouse.WindowHandle := FWindowHandle;
  end;

  function TDirectInputManager.CreateJoystick(ddi: PDIDeviceInstance): TDirectInputJoystick;
  var
    Device: IDirectInputDevice8;
    JoystickIndex: Integer;
  begin
    Device := CreateDirectInputDevice(ddi.guidInstance);
    if Device = Nil then Exit;
    if not Succeeded(Device.SetDataFormat(c_dfDIJoystick2)) then Exit;

    JoystickIndex := Length(FJoysticks);

    SetLength(FJoysticks, Length(FJoysticks) + 1);

    FJoysticks[JoystickIndex] := TDirectInputJoystick.Create(Device);
    Result := FJoysticks[JoystickIndex];
  end;

  function TDirectInputManager.CreateDirectInputDevice(DeviceType: TGUID): IDirectInputDevice8;
  begin
    if FProperlyInitialized then begin
      if not Succeeded(FDirectInput8.CreateDevice(DeviceType, Result, Nil)) then begin
        Result := Nil;
      end;
    end;
  end;

  function TDirectInputManager.GetJoystickCount: Integer;
  begin
    Result := Length(FJoysticks);
  end;

  procedure TDirectInputManager.ReleaseJoysticks;
  var
    I: Integer;
  begin
    for I := 0 to Length(FJoysticks) - 1 do begin
      if (FJoysticks[I] <> Nil) then begin
        FJoysticks[I].Free;
        FJoysticks[I] := Nil;
      end;
    end;
    SetLength(FJoysticks, 0);
  end;

  function TDirectInputManager.JoystickButtonIsPressed(Button: Integer; Joystick: Integer): Boolean;
  begin
    if Joystick <= JoystickCount then begin
      Result := Joysticks[Joystick].ButtonIsPressed(Button);
    end;
  end;

  function TDirectInputManager.JoystickButtonWasPressed(Button: Integer; Joystick: Integer): Boolean;
  begin
    if Joystick <= JoystickCount then begin
      Result := Joysticks[Joystick].ButtonWasPressed(Button);
    end;
  end;

  function TDirectInputManager.JoystickButtonWasReleased(Button: Integer; Joystick: Integer): Boolean;
  begin
    if Joystick <= JoystickCount then begin
      Result := Joysticks[Joystick].ButtonWasReleased(Button);
    end;
  end;

  function EnumerateJoysticksCallback(ddi: PDIDeviceInstance; Ref: Pointer): Boolean; stdcall;
  begin
    InputManager.CreateJoystick(ddi);
  end;

  procedure TDirectInputManager.EnumerateJoysticks;
  begin
    ReleaseJoysticks;
    if not Succeeded(FDirectInput8.EnumDevices(DI8DEVCLASS_GAMECTRL, @EnumerateJoysticksCallback, Nil, DIEDFL_ATTACHEDONLY)) then begin
      ReleaseJoysticks;
    end;
  end;

  function TDirectInputManager.GetJoystick(Index: Integer): TDirectInputJoystick;
  begin
    if (Index >= 0) and (Index < JoystickCount) then begin
      Result := FJoysticks[Index];
    end;
  end;

  procedure TDirectInputManager.UpdateJoystick(Index: Integer);
  begin
    if (Index >= 0) and (Index < JoystickCount) then begin
      Joysticks[Index].Update;
    end;
  end;

  procedure TDirectInputManager.Initialize;
  begin
    FWindowHandle := GetModuleHandle(Nil);
    FProperlyInitialized := Succeeded(DirectInput8Create(FWindowHandle, DIRECTINPUT_VERSION, IID_IDirectInput8A, FDirectInput8, Nil));
    if FProperlyInitialized then begin
      CreateKeyboard;
      CreateMouse;
      EnumerateJoysticks;
    end;
  end;

  procedure TDirectInputManager.Finalize;
  begin
    if FKeyboard <> Nil then begin
      // FKeyboard.Free;
    end;
    if FMouse <> Nil then begin
      // FMouse.Free;
    end;
  end;

  initialization

    InputManager.Initialize;

  finalization

    InputManager.Finalize;

end.