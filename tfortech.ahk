SendMode Input
CoordMode, Mouse, Window ;Keeps things within the bounds of the active window

Hotkey, IfWinActive, Stellaris ;Tells the Hotkey command to lock new hotkeys to Stellaris
Alphabet := "abcdefghijklmnopqrstuvwxyz"

Loop, Parse, Alphabet ;This loop dynamically creates passthrough hotkeys so the capslock key can be used to disable the script
{
  if !IsLabel(A_LoopField)
  {
    HotKey, $%A_LoopField%, lower_case_input
  }
  
  ;MsgBox +%A_LoopField%
  
  if !IsLabel(+%A_LoopField%)
  {
    HotKey, +$%A_LoopField%, shift_input
  }
  
}
return

ShouldDisable()
{
  return GetKeyState("CapsLock","t")
}

lower_case_input: ;This runs on lower case inputs that don't have a specific function, including when capslock is on
  Send % StrReplace(A_ThisHotkey, "$") ;This always outputs lowercase
return

shift_input:
  if(ShouldDisable()) {
    StringUpper , OutputVar, A_ThisHotkey
    Send % StrReplace(OutputVar, "$")
  }
  else {
    Send % StrReplace(A_ThisHotkey, "$")
  }
return

#IfWinActive Stellaris ;Any new hotkeys should be below this line

Technology_Window:
t::
if(ShouldDisable()) { ;To disable when capslock is on
  Send t
}
else {
  MouseGetPos, StartX, StartY
  Sleep 50
  MouseClick, left, 20, 1000 ;Note these co-ordinates are for a 4k resolution at UI scale 2.0
  Sleep 50
  MouseMove, StartX, StartY
}
return
