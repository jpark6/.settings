; autohotkey settings
mousePntInit()
return

; capslock �Է½� �ѱ�
capslock::
KeyWait, capslock
if A_TimeSinceThisHotkey >= 250 ; in milliseconds.
SetCapsLockState % !GetKeyState("CapsLock", "T")
else
Send, {vk15sc1F2}
return

!c::Send, ^c ; alt + c => ctrl + c
!v::Send, ^v ; alt + v => ctrl + v
!x::Send, ^x ; alt + x => ctrl + x

^!Space::Send {Media_Play_Pause} ; ctrl + alt + space : ���/����
^!Left::Send {Media_Prev}        ; ctrl + alt + <- : ����
^!Right::Send {Media_Next}       ; ctrl + alt + -> : ����

; Mute/Unmute, Volume Down, Volume Up
^!F5::SoundSet, +1, , mute       ; ctrl + alt + F5 : Mute 
^!F6::SoundSet, -5,              ; ctrl + alt + F6 : Volume Down 
^!F7::SoundSet, +5,              ; ctrl + alt + F7 : Volume Up

+^!d::Send, �ȳ��ϼ��� ��½�ť�� �ڹݼ��Դϴ�.{Enter}
+^!r::Send, �����մϴ�.{Enter}

; Mouse Move Point Init
mousePntInit() {
  global pmp := 10
  global mmp := -10
}

+^!u::MouseMove, %mmp%, %mmp%, 1, R ; shift + ctrl + alt + u : Ŀ�� �̵� �»�
+^!i::MouseMove, 0, %mmp%, 1, R ; shift + ctrl + alt + i     : Ŀ�� �̵� ��
+^!o::MouseMove, %pmp%, %mmp%, 1, R ; shift + ctrl + alt + o : Ŀ�� �̵� ���
+^!j::MouseMove, %mmp%, 0, 1, R ; shift + ctrl + alt + j     : Ŀ�� �̵� ��
+^!l::MouseMove, %pmp%, 0, 1, R ; shift + ctrl + alt + l     : Ŀ�� �̵� ��
+^!m::MouseMove, %mmp%, %pmp%, 1, R ; shift + ctrl + alt + m : Ŀ�� �̵� ����
+^!,::MouseMove, 0, %pmp%, 1, R ; shift + ctrl + alt + ,     : Ŀ�� �̵� ����
+^!.::MouseMove, %pmp%, %pmp%, 1, R ; shift + ctrl + alt + . : Ŀ�� �̵� ��

; Mouse Click, RClick
+^!k::MouseClick, left ; shift + ctrl + alt + k  : ���콺 ���� ��ư Ŭ��
+^!;::MouseClick, right ; shift + ctrl + alt + ; : ���콺 ���� ��ư Ŭ
+^![:: ; shift + ctrl + alt + [ : Ŀ�� �̵� �ȼ� ����
  if pmp > 0
  {
    pmp--
    mmp++
  }
  return
+^!]:: ; shift + ctrl + alt + ] : Ŀ�� �̵� �ȼ� ��
  if pmp < 500
  {
    pmp++
    mmp--
  }
  return
+^!':: ; shift + ctrl + alt + ' : Ŀ�� �̵� �ȼ� ��� 10 �� 100
  if pmp = 10
  {
    global pmp := 100
    global mmp := -100
  }
  else
  {
    global pmp := 10
    global mmp := -10
  }
  return

/*
; ESC, ctrl + [ �Է½� �������� ���� ��ȯ(vim)
^[::
  ret := IME_CHECK("A")
  if %ret% <> 0           ; 1 means IME is in Hangul(Korean) mode now.
  {
    Send, {Esc}
    Send, {vk15}    ;�ѱ��� ��� EscŰ�� �Է��ϰ� �ѿ�Ű�� �Է��� �ش�.
  }
  else if %ret% = 0       ; 0 means IME is in English mode now.
  {
    Send, {Esc}     ;������ ��� EscŰ�� �Է��Ѵ�.
  }
  return
$Esc::
  ret := IME_CHECK("A")
  if %ret% <> 0           ; 1 means IME is in Hangul(Korean) mode now.
  {
    Send, {Esc}
    Send, {vk15}    ;�ѱ��� ��� EscŰ�� �Է��ϰ� �ѿ�Ű�� �Է��� �ش�.
  }
  else if %ret% = 0       ; 0 means IME is in English mode now.
  {
    Send, {Esc}     ;������ ��� EscŰ�� �Է��Ѵ�.
  }
  return
*/
/*
  IME check 
*/
IME_CHECK(WinTitle) {
  WinGet,hWnd,ID,%WinTitle%
  Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam) {
  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows,ON
   SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
  if (DetectSave <> A_DetectHiddenWindows)
      DetectHiddenWindows,%DetectSave%
  return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd) {
  return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}

