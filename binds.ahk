; AutoHotkey Version: v1.1.13.01
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

ScrollLock::reload
NumLock::reload
Pause::suspend

*PgUp::clickOptions()
*PgDn::clickPlay()
;; F5::calculateDimensions()

;; F1::click1()
;; F2::click2()
;; F3::click3()

*Numpad9::    cycleButtons(1)
*NumpadPgUp:: cycleButtons(1)
*RControl::   cycleButtons(1)
*Numpad1::    cycleButtons(-1) 	
*NumpadEnd::  cycleButtons(-1)
*Numpad7::    cycleButtons(-1) 	
*NumpadHome:: cycleButtons(-1)
*End::        clickEndTurn()
;; *Delete::     clickEndTurn()
*NumpadSub::  clickEndTurn()
*NumpadDot::  rightClick()
*Numpad0::    click()
*NumpadIns::  click()
*Numpad6::    moveHor(1)
*NumpadRight::moveHor(1)
*Right::      moveHor(1)
*Numpad4::    moveHor(-1)
*NumpadLeft:: moveHor(-1)
*Left::       moveHor(-1)
*Numpad8::    moveVer(1)
*NumpadUp::   moveVer(1)
*Up::         moveVer(1)
*Numpad5::    moveVer(-1)
*NumpadClear::moveVer(-1)
*Numpad2::    moveVer(-1)
*NumpadDown:: moveVer(-1)
*Down::       moveVer(-1)

#IfWinActive
