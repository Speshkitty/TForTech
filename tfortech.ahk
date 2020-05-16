SendMode Input  ;
CoordMode, Mouse, Window

#IfWinActive Stellaris
t::
if(GetKeyState("CapsLock","t")) {
  Send t
}
else {
  MouseGetPos, StartX, StartY
  Sleep 50
  MouseClick, left, 20, 1000
  Sleep 50
  MouseMove, StartX, StartY
}
return

+t::
if(GetKeyState("CapsLock","t")) {
  Send T
}
else {
  Send +t
}
return
