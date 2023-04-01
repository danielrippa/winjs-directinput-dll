unit ChakraDirectInput;

{$mode delphi}

interface

  uses ChakraTypes;

  function GetJsValue: TJsValue;

implementation

  uses
    Chakra, ChakraUtils, DirectInputManager, DirectInputDevices, DirectInputUtils;

  var
    Gamepad: TDirectInputJoystick;

  function GetGamepad: TDirectInputJoystick;
  begin
    Gamepad := Nil;

    with InputManager do begin
      if JoystickCount > 0 then begin
        Gamepad := InputManager.Joysticks[0];
      end;
    end;

    Result := Gamepad;
  end;

  function ChakraIsGamepadAvailable(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := BooleanAsJsBoolean(GetGamepad <> Nil);
  end;

  function ChakraUpdateGamepad(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := Undefined;

    if GetGamepad <> Nil then begin
      Gamepad.Update;
    end;
  end;

  function ChakraIsGamepadButtonPressed(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    CheckParams('isGamepadButtonPressed', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(False);
    if GetGamepad <> Nil then begin
      Result := BooleanAsJsBoolean(Gamepad.ButtonIsPressed(JsNumberAsInt(Args^)));
    end;
  end;

  function ChakraWasGamepadButtonPressed(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    CheckParams('wasGamepadButtonPressed', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(False);
    if GetGamepad <> Nil then begin
      Result := BooleanAsJsBoolean(Gamepad.ButtonWasPressed(JsNumberAsInt(Args^)));
    end;
  end;

  function ChakraWasGamepadButtonReleased(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    CheckParams('wasGamepadButtonReleased', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(False);
    if GetGamepad <> Nil then begin
      Result := BooleanAsJsBoolean(Gamepad.ButtonWasReleased(JsNumberAsInt(Args^)));
    end;
  end;

  function ChakraGetPressedKeyNames(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := StringAsJsString(GetPressedKeyNames);
  end;

  function ChakraGetReleasedKeyNames(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := StringAsJsString(GetReleasedKeyNames);
  end;

  function ChakraGetPressedGamepadButtonNames(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := StringAsJsString(GetPressedGamepadButtonNames);
  end;

  function ChakraGetReleasedGamepadButtonNames(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := StringAsJsString(GetReleasedGamepadButtonNames);
  end;

  function ChakraUpdateKeyboard(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := Undefined;
    InputManager.Keyboard.Update;
  end;

  function ChakraFlushKeyboard(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := Undefined;
    InputManager.Keyboard.Flush;
  end;

  function ChakraIsKeyPressed(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := BooleanAsJsBoolean(False);
    CheckParams('isKeyPressed', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(InputManager.Keyboard.KeyIsPressed(JsNumberAsInt(Args^)));
  end;

  function ChakraWasKeyPressed(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := BooleanAsJsBoolean(False);
    CheckParams('wasKeyPressed', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(InputManager.Keyboard.KeyWasPressed(JsNumberAsInt(Args^)));
  end;

  function ChakraWasKeyReleased(Args: PJsValue; ArgCount: Word): TJsValue;
  begin
    Result := BooleanAsJsBoolean(False);
    CheckParams('wasKeyReleased', Args, ArgCount, [jsNumber], 1);

    Result := BooleanAsJsBoolean(InputManager.Keyboard.KeyWasReleased(JsNumberAsInt(Args^)));
  end;

  function GetJsValue;
  begin

    Result := CreateObject;

    SetFunction(Result, 'isGamepadAvailable', ChakraIsGamepadAvailable);
    SetFunction(Result, 'updateGamepad', ChakraUpdateGamepad);
    SetFunction(Result, 'isGamepadButtonPressed', ChakraIsGamepadButtonPressed);
    SetFunction(Result, 'wasGamepadButtonPressed', ChakraWasGamepadButtonPressed);
    SetFunction(Result, 'wasGamepadButtonReleased', ChakraWasGamepadButtonReleased);

    SetFunction(Result, 'getPressedKeyNames', ChakraGetPressedKeyNames);
    SetFunction(Result, 'getReleasedKeyNames', ChakraGetReleasedKeyNames);
    SetFunction(Result, 'getPressedGamepadButtonNames', ChakraGetPressedGamepadButtonNames);
    SetFunction(Result, 'getReleasedGamepadButtonNames', ChakraGetReleasedGamepadButtonNames);

    SetFunction(Result, 'udpdateKeyboard', ChakraUpdateKeyboard);
    SetFunction(Result, 'flushKeyboard', ChakraFlushKeyboard);

    SetFunction(Result, 'isKeyPressed', ChakraIsKeyPressed);
    SetFunction(Result, 'wasKeyPressed', ChakraWasKeyPressed);
    SetFunction(Result, 'wasKeyReleased', ChakraWasKeyReleased);

  end;

end.
