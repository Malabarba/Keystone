; AutoHotkey Version: v1.1.13
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybinds
;; Here we bind the actual keys.
#IfWinActive Hearthstone

~Enter::suspend

+Space::clickEndTurn()
Space::click()

*e::clickEndTurn()
*8::clickEndTurn()
*o::click()
*b::clickOptions()
*m::clickPlay()
*n::rightClick()
*p::cycleButtons(1)
*u::cycleButtons(-1) 	
*l::moveHor(1)
*j::moveHor(-1)
*i::moveVer(1)
*k::moveVer(-1)

#IfWinActive
