; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
;
; Script Function:
;
#InstallMouseHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybinds
;; Here we bind the actual keys.
#IfWinActive Hearthstone

F12::reload
Pause::suspend

F10::clickOptions()
+Space::clickEndTurn()
F2::calculateDimensions()

*Numpad9::    cycleButtons(1)
*NumpadPgUp:: cycleButtons(1)
*PgDn::       cycleButtons(1)
*RControl::   cycleButtons(1)
*Numpad1::    cycleButtons(-1) 	
*NumpadEnd::  cycleButtons(-1)
*Numpad7::    cycleButtons(-1) 	
*NumpadHome:: cycleButtons(-1)
*End::        clickEndTurn()
*Delete::     clickEndTurn()
*NumpadSub::  clickEndTurn()
*Numpad5::    click()
*NumpadClear::click()
*Numpad0::    click()
*NumpadIns::  click()
*Numpad6::    moveRight()
*NumpadRight::moveRight()
*Right::      moveRight()
*Numpad4::    moveLeft()
*NumpadLeft:: moveLeft()
*Left::       moveLeft()
*Numpad8::    moveUp()
*NumpadUp::   moveUp()
*Up::         moveUp()
*Numpad2::    moveDown()
*NumpadDown:: moveDown()
*Down::       moveDown()

#IfWinActive

#9::
  Run, C:\Program Files\Hearthstone\Hearthstone Beta Launcher.exe
  WinWait, Hearthstone
  calculateDimensions()
  return
  
#0::MsgBox, handStep %handStep% `n WindowX %WindowX% `n WindowY %WindowY% `n WindowWidth %WindowWidth% `n WindowHeight %WindowHeight% `n  actualWidth %actualWidth% `n actualHeight %actualHeight% `n endTurnX %endTurnX% `n HandStep %HandStep% `n BoardStep %BoardStep% `n endTurnX %endTurnX% `n


;; *c::moveRowTowards(0,1)
;; *d::moveRowTowards(1,1)
;; *e::moveRowTowards(2,1)
;; *x::moveRowTowards(0,-1)
;; *s::moveRowTowards(1,-1)
;; *w::moveRowTowards(2,-1)

;; *z::moveRowTowards(0,-2)
;; *a::moveRowTowards(1,-2)
;; *q::moveRowTowards(2,-2)
;; *v::moveRowTowards(0,2)
;; *f::moveRowTowards(1,2)
;; *r::moveRowTowards(2,2)

;; Numpad1 	NumpadEnd
;; Numpad3 	NumpadPgDn
;; NumpadDot  	NumpadDel
;; NumpadDiv  	NumpadDiv 
;; NumpadMult  	NumpadMult 
;; NumpadEnter 	NumpadEnter

;; *NumpadAdd::cycleButtons()

;; *d::move()
;; *e::move()
;; *x::move()
;; *s::move()
;; *w::move()
;; *z::move()
;; *a::move()
;; *q::move()

;; +v::moveRowTowards(0, 4)
;; +f::moveRowTowards(1, 4)
;; +r::moveRowTowards(2, 4)
;; +c::moveRowTowards(0, 3)
;; +d::moveRowTowards(1, 3)
;; +e::moveRowTowards(2, 3)
;; +x::moveRowTowards(0, -3)
;; +s::moveRowTowards(1, -3)
;; +w::moveRowTowards(2, -3)
;; +z::moveRowTowards(0, -4)
;; +a::moveRowTowards(1, -4)
;; +q::moveRowTowards(2, -4)
