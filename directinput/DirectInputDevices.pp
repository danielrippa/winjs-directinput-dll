unit DirectInputDevices;

{$mode delphi}

interface

  uses

    DirectInputTypes, DirectInput8Types;

  type

    TDirectInputDevice = class
      private
        FDirectInputDevice: IDirectInputDevice8;
      protected
        property DirectInputDevice: IDirectInputDevice8 read FDirectInputDevice;
      public
        constructor Create(aDirectInputDevice: IDirectInputDevice8);
        destructor Destroy; override;
    end;

    TKeyboardBuffer = array[0..255] of byte;

    TDirectInputKeyboard = class(TDirectInputDevice)
      private
        FPressedKeys: TKeyboardBuffer;
        FReleasedKeys: TKeyboardBuffer;
      public
        constructor Create(aDirectInputDevice: IDirectInputDevice8);

        function KeyIsPressed(KeyCode: Integer): Boolean;

        function KeyWasPressed(KeyCode: Integer): Boolean;
        function KeyWasReleased(KeyCode: Integer): Boolean;

        property PressedKeys: TKeyboardBuffer read FPressedKeys;
        property ReleasedKeys: TKeyboardBuffer read FReleasedKeys;

        procedure Update;
        procedure Flush;
    end;

    TMouseBuffer = array[0..7] of Integer;

    TDirectInputMouse = class(TDirectInputDevice)
      private
        FWindowHandle: THandle;
        FPressedButtons: TMouseBuffer;
        FReleasedButtons: TMouseBuffer;

        FHorizontalDelta: Integer;
        FVerticalDelta: Integer;
        FWheelDelta: Integer;

        FMouseEvent: THandle;
        procedure ResetButtonState;
      public
        constructor Create(aDirectInputDevice: IDirectInputDevice8);

        function ButtonWasPressed(ButtonIndex: Integer): Boolean;
        function ButtonWasReleased(ButtonIndex: Integer): Boolean;

        property WindowHandle: THandle read FWindowHandle write FWindowHandle;

        property WheelDelta: Integer read FWheelDelta;
        property HorizontalDelta: Integer read FHorizontalDelta;
        property VerticalDelta: Integer read FVerticalDelta;

        procedure Update(Reset: Boolean = True);
    end;

    TJoystickBuffer = array[0..127] of Integer;

    TDirectInputJoystick = class(TDirectInputDevice)
      private
        FJoystickState: TDIJoyState2;
        FCapabilities: TDIDevCaps;

        FReleasedButtons: TJoystickBuffer;
        FPressedButtons: TJoystickBuffer;

        FButtonCount: Integer;
        FAxisCount: Integer;
        FPOVCount: Integer;
      public
        constructor Create(aDirectInputDevice: IDirectInputDevice8);
        property ButtonCount: Integer read FButtonCount;
        property AxisCount: Integer read FAxisCount;
        property POVCount: Integer read FPOVCount;

        property PressedButtons: TJoystickBuffer read FPressedButtons;
        property ReleasedButtons: TJoystickBuffer read FReleasedButtons;

        function ButtonIsPressed(ButtonIndex: Integer): Boolean;
        function ButtonWasPressed(ButtonIndex: Integer): Boolean;
        function ButtonWasReleased(ButtonIndex: Integer): Boolean;

        procedure Update;
    end;

implementation

uses

  windows, sysutils;

constructor TDirectInputDevice.Create(aDirectInputDevice: IDirectInputDevice8);
begin
  FDirectInputDevice := aDirectInputDevice;
end;

destructor TDirectInputDevice.Destroy;
begin
  if FDirectInputDevice <> Nil then begin
    FDirectInputDevice.Unacquire;
    FDirectInputDevice := Nil;
  end;
end;

constructor TDirectInputKeyboard.Create(aDirectInputDevice: IDirectInputDevice8);
begin
  inherited;
  if not Succeeded(DirectInputDevice.SetDataFormat(c_dfDIKeyboard)) then Exit;
  FillChar(FPressedKeys, SizeOf(FPressedKeys), 0);
  FillChar(FReleasedKeys, SizeOf(FReleasedKeys), 0);
end;

procedure TDirectInputKeyboard.Update;
var
  Result: Integer;
begin
  Move(FPressedKeys, FReleasedKeys, SizeOf(TKeyboardBuffer));
  with DirectInputDevice do begin
    Result := GetDeviceState(SizeOf(TKeyboardBuffer), @FPressedKeys);
    if Result <> DI_OK then begin
      // First Attempt
      if (Result <> DIERR_INPUTLOST) and (Result <> DIERR_NOTACQUIRED) then Exit;
      if Acquire = DI_OK then begin
        // Second Attempt
        GetDeviceState(SizeOf(TKeyboardBuffer), @FPressedKeys);
      end;
    end;
  end;
end;

function TDirectInputKeyboard.KeyIsPressed(KeyCode: Integer): Boolean;
begin
  Result := (FPressedKeys[KeyCode] and $80) = $80;
end;

function TDirectInputKeyboard.KeyWasPressed(KeyCode: Integer): Boolean;
begin
  Result := ((FReleasedKeys[KeyCode] and $80) <> $80) and KeyIsPressed(KeyCode);
end;

function TDirectInputKeyboard.KeyWasReleased(KeyCode: Integer): Boolean;
begin
  Result := ((FReleasedKeys[KeyCode] and $80) = $80) and ((FPressedKeys[KeyCode] and $80) <> $80);
end;

procedure TDirectInputKeyboard.Flush;
var
  EventCount: Cardinal;
begin
  EventCount := INFINITE;
  DirectInputDevice.GetDeviceData(SizeOf(TDIDeviceObjectData), Nil, EventCount, 0);
end;

constructor TDirectInputMouse.Create(aDirectInputDevice: IDirectInputDevice8);
var
  SizeProperty: TDIPropDWord;
  CooperativeLevel: Cardinal;
begin
  inherited;
  if not Succeeded(DirectInputDevice.SetDataFormat(c_dfDIMouse)) then Exit;
  CooperativeLevel := DISCL_BACKGROUND or DISCL_NONEXCLUSIVE;
  if not Succeeded(DirectInputDevice.SetCooperativeLevel(FWindowHandle, CooperativeLevel)) then begin
    Exit;
  end;
  FMouseEvent := CreateEvent(Nil, False, False, Nil);
  if FMouseEvent = 0 then Exit;
  if not Succeeded(DirectInputDevice.SetEventNotification(FMouseEvent)) then Exit;
  FillChar(SizeProperty, SizeOf(SizeProperty), 0);
  with SizeProperty.diph do begin
    dwSize := SizeOf(TDIPropDWord);
    dwHeaderSize := SizeOf(TDIPropHeader);
    dwObj := 0;
    dwHow := DIPH_DEVICE;
  end;
  SizeProperty.dwData := 512;
  if not Succeeded(DirectInputDevice.SetProperty(DIPROP_BUFFERSIZE, SizeProperty.diph)) then Exit;
  ResetButtonState;
end;

procedure TDirectInputMouse.ResetButtonState;
var
  I: Integer;
begin
  for I := Low(FPressedButtons) to High(FPressedButtons) do begin
    FPressedButtons[I] := 0;
    FReleasedButtons[I] := 0;
  end;
end;

function TDirectInputMouse.ButtonWasPressed(ButtonIndex: Integer): Boolean;
begin
  if (ButtonIndex >= 0) and (ButtonIndex < 8) then begin
    Result := FPressedButtons[ButtonIndex] > 0;
  end else begin
    Result := False;
  end;
end;

function TDirectInputMouse.ButtonWasReleased(ButtonIndex: Integer): Boolean;
begin
  if (ButtonIndex >= 0) and (ButtonIndex < 8) then begin
    Result := FReleasedButtons[ButtonIndex] > 0;
  end else begin
    Result := False;
  end;
end;

procedure TDirectInputMouse.Update(Reset: Boolean);
var
  Result: Integer;
  EventCount: Cardinal;
  ObjectData: TDIDeviceObjectData;
  Data: DWord;
  IntData: Integer;
  ButtonClicked: Integer;
  ButtonReleased: Integer;
  ButtonIndex: Integer;
begin
  if Reset then ResetButtonState;
  repeat
    EventCount := 1;
    // First Attempt
    Result := DirectInputDevice.GetDeviceData(SizeOf(TDIDeviceObjectData), @ObjectData, EventCount, 0);
    if (Result <> DI_OK) and (Result <> DI_BUFFEROVERFLOW) then begin
      if (Result <> DIERR_INPUTLOST) and (Result <> DIERR_NOTACQUIRED) then begin
        Exit;
      end;
    end;
    if Result = DIERR_NOTACQUIRED then begin
      DirectInputDevice.Unacquire;
    end;
    Result := DirectInputDevice.Acquire;
    if (Result = DI_OK) or (Result = S_FALSE) then begin
      // Second Attempt
      Result := DirectInputDevice.GetDeviceData(SizeOf(TDIDeviceObjectData), @ObjectData, EventCount, 0);
      if (Result <> DI_OK) and (Result <> DI_BUFFEROVERFLOW) then begin
        Exit;
      end;
    end else begin
      Exit;
    end;

    if EventCount < 1 then Break;

    Data := ObjectData.dwData;
    IntData := Data;

    case ObjectData.dwOfs of
      DIMOFS_X: Inc(FVerticalDelta, IntData);
      DIMOFS_Y: Inc(FHorizontalDelta, IntData);
      DIMOFS_Z: Inc(FWheelDelta, IntData);

      DIMOFS_BUTTON0..DIMOFS_BUTTON7: begin
        ButtonClicked := 0;
        ButtonReleased := 1;
        if ((Data and $80) = $80) then begin
          ButtonClicked := 1;
          ButtonReleased := 0;
        end;

        ButtonIndex := ObjectData.dwofs - DIMOFS_BUTTON0;
        FPressedButtons[ButtonIndex] := ButtonClicked;
        FReleasedButtons[ButtonIndex] := ButtonReleased;
      end;
    end;

  until EventCount < 1;
end;

type

  PJoyEnumRef = ^TJoyEnumRef;
  TJoyEnumRef = record
    DirectInputDevice: IDirectInputDevice8;
  end;

function EnumerateAxisCallback(var ddoi: TDIDeviceObjectInstance; Ref: Pointer): Boolean; stdcall;
var
  RangeProperty: TDIPropRange;
  EnumRef: PJoyEnumRef;
begin
  EnumRef := Ref;

  with RangeProperty.diph do begin
    dwSize := SizeOf(TDIPropRange);
    dwHeaderSize := SizeOf(TDIPropHeader);
    dwHow := DIPH_BYID;
    dwObj := ddoi.dwType;
  end;
  with RangeProperty do begin
    lMin := Low(SmallInt);
    lMax := High(SmallInt);
  end;

  if EnumRef.DirectInputDevice.SetProperty(DIPROP_RANGE, RangeProperty.diph) <> DI_OK then begin
    Result := DIENUM_STOP;
  end else begin
    Result := DIENUM_CONTINUE;
  end;
end;

constructor TDirectInputJoystick.Create(aDirectInputDevice: IDirectInputDevice8);
var
  EnumRef: TJoyEnumRef;
begin
  inherited;

  // todo: coop level

  EnumRef.DirectInputDevice := FDirectInputDevice;

  if not Succeeded(FDirectInputDevice.EnumObjects(@EnumerateAxisCallback, @EnumRef, DIDFT_AXIS)) then begin
    Exit;
  end;
  FillChar(FCapabilities, SizeOf(TDIDevCaps), 0);
  FCapabilities.dwSize := SizeOf(TDIDevCaps);
  if not Succeeded(FDirectInputDevice.GetCapabilities(FCapabilities)) then begin
    Exit;
  end;
  with FCapabilities do begin
    FButtonCount := dwButtons;
    FAxisCount := dwAxes;
    FPOVCount := dwPOVs;
  end;

  FillChar(FPressedButtons, SizeOf(FPressedButtons), 0);
  FillChar(FReleasedButtons, SizeOf(FReleasedButtons), 0);

end;

procedure TDirectInputJoystick.Update;
var
  Result: Integer;
  I: Integer;
  ButtonClicked: Integer;
  ButtonReleased: Integer;
  ButtonIndex: Integer;
begin

  Move(FPressedButtons, FReleasedButtons, SizeOf(TJoystickBuffer));

  // First Attempt
  Result := FDirectInputDevice.Poll;
  if (Result <> DI_OK) and (Result <> DI_NOEFFECT) then begin
    if (Result <> DIERR_INPUTLOST) and (Result <> DIERR_NOTACQUIRED) then begin
      Exit;
    end;
    if Succeeded(FDirectInputDevice.Acquire) then begin
      // Second Attempt
      Result := FDirectInputDevice.Poll;
      if (Result <> DI_OK) and (Result <> DI_NOEFFECT) then begin
        Exit;
      end;
    end else begin
      Exit;
    end;
  end;

  // OK, Polled
  // First Attempt
  Result := FDirectInputDevice.GetDeviceState(SizeOf(TDIJoyState2), @FJoystickState);
  if Result <> DI_OK then begin
    if (Result <> DIERR_INPUTLOST) and (Result <> DIERR_NOTACQUIRED) then begin
      Exit;
    end;
    if Succeeded(FDirectInputDevice.Acquire) then begin
      // Second Attempt
      if not Succeeded(FDirectInputDevice.GetDeviceState(SizeOf(TDIJoyState2), @FJoystickState)) then begin
        Exit;
      end;
    end;
  end;

  for I := 0 to FButtonCount - 1 do begin
    ButtonClicked := 0;
    ButtonReleased := 1;
    if (FJoystickState.rgbButtons[I] and $80) = $80 then begin
      ButtonClicked := 1;
      ButtonReleased := 0;
    end;

    FPressedButtons[I] := ButtonClicked;
    FReleasedButtons[I] := ButtonReleased;
  end;

end;

function TDirectInputJoystick.ButtonIsPressed(ButtonIndex: Integer): Boolean;
begin
  Result := FPressedButtons[ButtonIndex] > 0;
end;


function TDirectInputJoystick.ButtonWasPressed(ButtonIndex: Integer): Boolean;
begin
  if (ButtonIndex >= 0) and (ButtonIndex < FButtonCount) then begin
    Result := FPressedButtons[ButtonIndex] > 0;
  end else begin
    Result := False;
  end;
end;

function TDirectInputJoystick.ButtonWasReleased(ButtonIndex: Integer): Boolean;
begin
  if (ButtonIndex >= 0) and (ButtonIndex < FButtonCount) then begin
    Result := FReleasedButtons[ButtonIndex] > 0;
  end else begin
    Result := False;
  end;
end;

end.