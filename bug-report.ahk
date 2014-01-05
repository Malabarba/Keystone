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

bugReport() {
  WinGetPos, xc, yc, WindowWidth, WindowHeight, Hearthstone
  Run, https://github.com/Bruce-Connor/Keystone/issues/new
  Sleep 1000
  MsgBox,, Thanks for reporting!,I'm opening the github issues page. If you don't have a github account`, you can also post a comment on whichever forum you learned about Hearthstone.`nPlease include the following data in your bug report (you can copy it with Ctrl+C):`n x%xc% y%yc% w%WindowWidth% h%WindowHeight% `n And are you playing in windowed mode?
}