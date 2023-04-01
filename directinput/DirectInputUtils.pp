unit DirectInputUtils;

{$mode delphi}

interface

  function GetPressedKeyNames: UnicodeString;
  function GetReleasedKeyNames: UnicodeString;
  function GetPressedGamepadButtonNames: UnicodeString;
  function GetReleasedGamepadButtonNames: UnicodeString;

implementation

  uses

    DirectInputManager, Classes;

  const

    KeyNames: array [$01..$ED] of string =
    (
      'esc', // 0x01
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine', // 0x0a
      'zero',
      'minus',
      'equals',
      'backspace',
      'tab',
      'q', // 0x10
      'w',
      'e',
      'r',
      't',
      'y',
      'u',
      'i',
      'o',
      'p',
      'left_bracket', // 0x1a
      'right_bracket',
      'enter',
      'left_control',
      'a',
      's',
      'd', // 0x20
      'f',
      'g',
      'h',
      'j',
      'k',
      'l',
      'semicolon',
      'apostrophe',
      'grave',
      'left_shift', // 0x2a
      'back_slash',
      'z',
      'x',
      'c',
      'v',
      'b', // 0x30
      'n',
      'm',
      'comma',
      'period',
      'forward_slash',
      'right_shift',
      'numpad_multiply',
      'left_alt',
      'space',
      'capslock', // 0x3a
      'f1',
      'f2',
      'f3',
      'f4',
      'f5',
      'f6', // 0x40
      'f7',
      'f8',
      'f9',
      'f10',
      'num_lock',
      'scroll_lock',
      'numpad_7',
      'numpad_8',
      'numpad_9',
      'numpad_minus', // 0x4a
      'numpad_4',
      'numpad_5',
      'numpad_6',
      'numpad_plus',
      'numpad_1',
      'numpad_2', // 0x50
      'numpad_3',
      'numpad_0',
      'numpad_decimal', // 0x53
      '', // 0x54
      '', // 0x55
      'oem_102', // 0x56
      'f11',
      'f12', // 0x58
      '', // 0x59
      '', // 0x5a
      '', // 0x5b
      '', // 0x5c
      '', // 0x5d
      '', // 0x5e
      '', // 0x5f
      '', // 0x60
      '', // 0x61
      '', // 0x62
      '', // 0x63
      'f13', // 0x64
      'f14',
      'f15',
      '', // 0x67
      '', // 0x68
      '', // 0x69
      '', // 0x6a
      '', // 0x6b
      '', // 0x6c
      '', // 0xcd
      '', // 0xce
      '', // 0xcf
      'kana', // 0x70
      '', // 0x71
      '', // 0x72
      'abnt_c1',
      '', // 0x74
      '', // 0x75
      '', // 0x76
      '', // 0x77
      '', // 0x78
      'convert', // 0x79
      '', // 0x7a
      'no_convert', // 0x7b
      '', // 0x7c
      'yen',
      'abnt_c2',
      '', // 0x7f
      '', // 0x80
      '', // 0x81
      '', // 0x82
      '', // 0x83
      '', // 0x84
      '', // 0x85
      '', // 0x86
      '', // 0x87
      '', // 0x88
      '', // 0x89
      '', // 0x8a
      '', // 0x8b
      '', // 0x8c
      'numpad_equals', // 0x8d
      '', // 0x8e
      '', // 0x8f
      'track_previous', // 0x90
      'at',
      'colon',
      'underline',
      'kanji',
      'stop',
      'ax',
      '', // 0x97
      '', // 0x98
      'track_next', // 0x99
      '', // 0x9a
      '', // 0x9b
      'numpad_enter', // 0x9c
      'right_control', // 0x9d
      '', // 0x9e
      '', // 0x9f
      'mute', // 0xa0
      'calculator',
      'media_playpause', // 0xa2
      '', // 0xa3
      'media_stop', // 0xa4
      '', // 0xa5
      '', // 0xa6
      '', // 0xa7
      '', // 0xa8
      '', // 0xa9
      '', // 0xaa
      '', // 0xab
      '', // 0xac
      '', // 0xad
      'volume_down', // 0xae
      '', // 0xaf
      'volume_up', // 0xb0
      '', // 0xb1
      'web_home', // 0xb2
      'numpad_comma', // 0xb3
      '', // 0xb4
      'numpad_divide', // 0xb5
      '', // 0xb6
      'system_request', // 0xb7
      'right_alt', // 0xb8
      '', // 0xb9
      '', // 0xba
      '', // 0xbb
      '', // 0xbc
      '', // 0xbd
      '', // 0xbe
      '', // 0xbf
      '', // 0xc0
      '', // 0xc1
      '', // 0xc2
      '', // 0xc3
      '', // 0xc4
      'pause', // 0xc5
      '', // 0xc6
      'home', // 0xc7
      'arrow_up',
      'page_up', // 0xc9
      '', // 0xca
      'arrow_left', // 0xcb
      '', // 0xcc
      'arrow_right', // 0xcd
      '', // 0xce
      'end', // 0xcf
      'arrow_down', // 0xd0
      'page_down',
      'insert',
      'delete', // 0xd3
      '', // 0xd4
      '', // 0xd5
      '', // 0xd6
      '', // 0xd7
      '', // 0xd8
      '', // 0xd9
      '', // 0xda
      'left_windows', // 0xdb
      'right_windows',
      'menu',
      'power',
      'sleep', // 0xdf
      '', // 0xe0
      '', // 0xe1
      '', // 0xe2
      'wake', // 0xe3
      '', // 0xe4
      'web_search', // 0xe5
      'web_favorites',
      'web_refresh',
      'web_stop',
      'web_forward', // 0xe9
      'web_back', // 0xea
      'mycomputer', // 0xeb
      'mail', // 0xec
      'media_select' // 0xed
    );

    GamepadButtonNames: array [0..127] of string = (
      'y',
      'b',
      'a',
      'x',
      'left_shoulder',
      'right_shoulder',
      'left_trigger',
      'right_trigger',
      'select',
      'start',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', '', '', '',
      '', '', '', '', '', '', '', ''
    );

  function GetPressedKeyNames: UnicodeString;
  var
    Names: TStringList;
    I: Integer;
    Name: UnicodeString;
  begin
    Names := TStringList.Create;
    with InputManager.Keyboard do begin
      Update;
      for I := 1 to Length(KeyNames) - 1 do begin
        if KeyIsPressed(I) then begin
          Name := KeyNames[I];
          if Name <> '' then begin
            Names.Add(Name);
          end;
        end;
      end;
      Result := Names.CommaText;
    end;
    Names.Free;
  end;

  function GetReleasedKeyNames: UnicodeString;
  var
    Names: TStringList;
    I: Integer;
    Name: UnicodeString;
  begin
    Names := TStringList.Create;
    with InputManager.Keyboard do begin
      Update;
      for I := 1 to Length(KeyNames) - 1 do begin
        if KeyWasReleased(I) then begin
          Name := KeyNames[I];
          if Name <> '' then begin
            Names.Add(Name);
          end;
        end;
      end;
      Result := Names.CommaText;
    end;
    Names.Free;
  end;

  function GetPressedGamepadButtonNames: UnicodeString;
  var
    Names: TStringList;
    I: Integer;
  begin
    Result := '';
    with InputManager do begin
      if JoystickCount >= 1 then begin
        UpdateJoystick(0);
        Names := TStringList.Create;
        for I := 0 to 9 do begin
          if JoystickButtonIsPressed(I, 0) then begin
            Names.Add(GamepadButtonNames[I]);
          end;
        end;
        Result := Names.CommaText;
        Names.Free;
      end;
    end;
  end;

  function GetReleasedGamepadButtonNames: UnicodeString;
  var
    Names: TStringList;
    I: Integer;
  begin
    Result := '';
    with InputManager do begin
      if JoystickCount >= 1 then begin
        UpdateJoystick(0);
        Names := TStringList.Create;
        for I := 0 to 9 do begin
          if JoystickButtonWasReleased(I, 0) then begin
            Names.Add(GamepadButtonNames[I]);
          end;
        end;
        Result := Names.CommaText;
        Names.Free;
      end;
    end;
  end;

end.