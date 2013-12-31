; AutoHotkey Version: v1.1.13
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
; Copyright:      Artur Malabarba <bruce.connor.am@gmail.com>
;
;; ### NO WARRANTY and DISCLAIMER ###
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;
;; Specifically, we take no responsibility if you get banned for using
;; it or accidentally spend money as a consequence of using it.
;; USE IT AT YOUR OWN RISK.
;;
;; On a lighter note, if Blizzard decides to rule against it, we'll do
;; our best to comply and to notify everyone.
;;
;; You may read, download, modify, and compile it at your leisure, but
;; you MAY NOT distribute it (or a modified version of it) without my
;; permission.

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
