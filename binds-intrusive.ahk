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

~Enter::suspend

+Space::clickEndTurn()
Space::click()

*e::clickEndTurn()
*8::clickEndTurn()
*p::click()
*b::clickOptions()
*m::clickPlay()
*n::rightClick()
*o::cycleButtons(1)
*u::cycleButtons(-1) 	
*l::moveRight()
*j::moveLeft()
*i::moveUp()
*k::moveDown()

#IfWinActive
