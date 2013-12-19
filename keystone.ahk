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

;; The following parameters all represent a fraction of the width or
;; height. i.e., a value of 0.9, means 0.9*WindowWidth. Let me know if
;; you need to change this.

calculateDimensions() {
  global  

  ;; The 'End' button is far to the right, so its X coordinate is almost 1.
  EndTurnX       := 0.91
  EndTurnY       := 0.45
  ;; Verytical position of your row of minions on the board
  FriendlyRowY   := 0.58
  ;; Vertical position of your hand
  HandRowY     := 0.962
  ;; Horizontal space between cards on the board
  boardStep      := 0.1
  ;; Horizontal space between cards on the hand
  handStep       := 0.05
  ;; Hero Weapon Button
  heroWeaponX    := 0.388
  heroWeaponY    := 0.765
  ;; Enemy Weapon Button
  enemyWeaponX   := 0.388
  enemyWeaponY   := 0.404
  ;; Enemy Power Button
  enemyPowerX    := 0.625
  enemyPowerY    := 0.404
  ;; Hero Power Button
  heroPowerX     := 0.625
  heroPowerY     := 0.765
  ;; Hero Icon
  heroIconX      := 0.5
  heroIconY      := 0.8
  ;; Enemy Icon
  enemyIconX     := 0.5
  enemyIconY     := 0.219849246231
  ;; hero icon, hero power, enemy icon
  numberOfCombatButtons := 3
  ;; moveToButton (remember to update)
  
  numberOfCombatRows := 5
  rowEnemyHero := 4
  rowEnemyMinions := 3
  rowPlayerMinions := 2
  rowPlayerHero := 1
  rowPlayerHand := 0
  
  ;; Arena Mode Buttons
  arenaModePlayButtonX := 0.6425
  arenaModePlayButtonY := 0.765
  arenaModeCard0Y      := 
  arenaModeCard0X      := 
  arenaModeCard1Y      := 
  arenaModeCard1X      := 
  arenaModeCard2Y      := 
  arenaModeCard2X      := 
  arenaModeCard3Y      := 
  arenaModeCard3X      := 

  ;; Play Mode Buttons
  playModePlayButtonX   := 0.80375
  playModePlayButtonY   := 0.82667
  playModeRankedButtonX := 0.875
  playModeRankedButtonY := 0.17
  playModeCasualButtonX := 0.74125
  playModeCasualButtonY := 0.17

  deck1X    := 0.715
  deck1Y    := 0.1625
  deckStepX := 0.16875
  deckStepY := 0.205

  ;; Main Menu
  playModeButtonX     := 0.5
  playModeButtonY     := 0.31
  practiceModeButtonX := 0.5
  practiceModeButtonY := 0.385
  arenaModeButtonX    := 0.5
  arenaModeButtonY    := 0.448333333333

  ;; Name of the Hearthstone window
  winTitle := "Hearthstone"

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;; Here we recalculate the parameters to have absolute values
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  WinGetPos, , , WindowWidth, WindowHeight, %winTitle%
  WindowX := 0
  WindowY := 0

  actualWidth := WindowWidth
  actualHeight := WindowHeight

  if (WindowHeight * 4 > WindowWidth * 3) {
      WindowHeight := (WindowWidth * 3)/4
      WindowY := WindowY + (actualHeight - WindowHeight)/2
  }
  else {
      if (WindowHeight * 4 < WindowWidth * 3) {
          WindowWidth := (WindowHeight * 4)/3
          WindowX := WindowX + (actualWidth - WindowWidth)/2
      }
  }

  heroPowerX     := WindowX + WindowWidth * heroPowerX
  heroPowerY     := WindowY + WindowHeight * heroPowerY
  heroIconX      := WindowX + WindowWidth * heroIconX
  heroIconY      := WindowY + WindowHeight * heroIconY
  enemyIconX     := WindowX + WindowWidth * enemyIconX
  enemyIconY     := WindowY + WindowHeight * enemyIconY
  arenaModePlayButtonX := WindowX + WindowWidth * arenaModePlayButtonX
  arenaModePlayButtonY := WindowY + WindowHeight * arenaModePlayButtonY
  arenaModeCard0Y      := 
  arenaModeCard0X      := 
  arenaModeCard1Y      := 
  arenaModeCard1X      := 
  arenaModeCard2Y      := 
  arenaModeCard2X      := 
  arenaModeCard3Y      := 
  arenaModeCard3X      :=
  playModePlayButtonX   := WindowX + WindowWidth * playModePlayButtonX
  playModePlayButtonY   := WindowY + WindowHeight * playModePlayButtonY
  playModeRankedButtonX := WindowX + WindowWidth * playModeRankedButtonX
  playModeRankedButtonY := WindowY + WindowHeight * playModeRankedButtonY
  playModeCasualButtonX := WindowX + WindowWidth * playModeCasualButtonX
  playModeCasualButtonY := WindowY + WindowHeight * playModeCasualButtonY
  deck1X    := WindowX + WindowWidth * deck1X
  deck1Y    := WindowY + WindowHeight * deck1Y
  deckStepX := WindowWidth * deckStepX
  deckStepY := WindowHeight * deckStepY
  playModeButtonX     := WindowX + WindowWidth * playModeButtonX
  playModeButtonY     := WindowY + WindowHeight * playModeButtonY
  practiceModeButtonX := WindowX + WindowWidth * practiceModeButtonX
  practiceModeButtonY := WindowY + WindowHeight * practiceModeButtonY
  arenaModeButtonX    := WindowX + WindowWidth * arenaModeButtonX
  arenaModeButtonY    := WindowY + WindowHeight * arenaModeButtonY

  handStep       := handStep       * WindowWidth
  boardStep      := boardStep      * WindowWidth
  handRowY     := WindowY + handRowY     * WindowHeight
  enemyRowY    := WindowY + WindowHeight*(1 - friendlyRowY)
  friendlyRowY := WindowY + WindowHeight * friendlyRowY

  currentRow := rowPlayerMinions

  endTurnX := WindowX + WindowWidth * EndTurnX
  endTurnY := WindowY + WindowHeight * endTurnY
}

calculateDimensions()

clickEndTurn() {  
  global
  MouseMove, %endTurnX%, %endTurnY%, 0, 
  click()
  sleep 100
  moveToButton(0)
  calculateDimensions()
}

click() {
  global
  ControlClick,, %winTitle%
  sleep 200
  If (currentRow = rowPlayerHand)
    moveRowTowards(rowEnemyMinions,1)
  else if (currentRow = rowEnemyHero) || (currentRow = rowEnemyMinions)
    moveRowTowards(rowPlayerMinions,1)
}

xStep(row) {
  global
  if (row = rowPlayerHand)
    return HandStep
  else
    return BoardStep
}

rowHeight(row) {
  global
  if (row = rowPlayerHand)
    return handRowY
  else {
      if (row = rowPlayerMinions)
        return friendlyRowY
      else
        return enemyRowY
  }
}

moveRowTowards(row, dir) {
  global
  local xMovement :=
  local yMovement :=
  
  if (row >= numberOfCombatRows) {
    row := 0
  }
  else if (row < 0) {
    row := numberOfCombatRows-1
  }
  if (isButtonRow(row)) {
    cycleButtons(dir)
  }
  else {
    if (currentRow = row) {
      xMovement := dir*xStep(row)
      MouseMove, %xMovement%, 0, 0, R
    }
    else {
      xMovement := WindowX + WindowWidth * 0.48 
      yMovement := rowHeight(row)
      MouseMove, %xMovement%, %yMovement%, 0
    }
    if (GetKeyState("Control"))
      MsgBox, yMovement %yMovement% `n xMovement %xMovement% `n currentRow %currentRow% `n row %row% `n currentRow %currentRow%
    currentRow := row
  }
}

moveRight() {
  global currentRow
  moveRowTowards(currentRow,1)
}
moveLeft() {
  global currentRow
  moveRowTowards(currentRow,-1)
}
moveUp() {
  global currentRow
  ;; if (isInHeroButton())
  ;;   currentRow := rowPlayerHand
  ;; if (currentRow = 3)
    ;; currentRow := -1
  moveRowTowards(currentRow+1,0)
} 
moveDown() {
  global currentRow
  ;; if (currentRow = 0)
  ;;   currentRow := numberOfCombatRows - 1
  ;; if (isInHeroButton())
  ;;   currentRow := rowPlayerMinions
  moveRowTowards(currentRow-1,0)
}

isInHeroButton() {
  global  
  if (currentRow = rowPlayerHero) && (cyclePosition < 2)
    return 1
  else  
    return false
}

cycleButtons(dir) {
  global  
  if (isButtonRow(currentRow)) {
      cyclePosition := mod(cyclePosition + dir, numberOfCombatButtons)
      if (cyclePosition < 0)
        cyclePosition := numberOfCombatButtons - 1
  }
  else {
      cyclePosition := 1 ;; Hero Power
      ;; MsgBox, cyclePosition
  }
  moveToButton(cyclePosition)
}

isButtonRow(row) {
  return ((row = rowEnemyHero) || (row = rowPlayerHero))
}

moveToButton(pos) {
  global  
  cyclePosition := pos   
  if (pos = 0){
    currentRow := rowPlayerHero
    MouseMove, heroIconX, heroIconY,,
  }
  else if (pos = 1){
    currentRow := rowPlayerHero
    MouseMove, heroPowerX, heroPowerY,,
  }
  else if (pos = 2){
    currentRow := rowEnemyHero
    MouseMove, enemyIconX, enemyIconY,,
  }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybinds
;; Here we bind the actual keys.
#IfWinActive Hearthstone

Space::click()
b::click()
+Space::clickEndTurn()
F2::calculateDimensions()

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

*e::clickEndTurn()
*8::clickEndTurn()
*p::click()
*o::cycleButtons(1)
*u::cycleButtons(-1) 	
*l::moveRight()
*j::moveLeft()
*i::moveUp()
*k::moveDown()

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

F12::reload
Pause::suspend
~Enter::suspend
#IfWinActive

#9::
  Run, C:\Program Files\Hearthstone\Hearthstone Beta Launcher.exe
  WinWait, Hearthstone
  calculateDimensions()
  return
  
#0::MsgBox, handStep %handStep% `n WindowX %WindowX% `n WindowY %WindowY% `n WindowWidth %WindowWidth% `n WindowHeight %WindowHeight% `n  actualWidth %actualWidth% `n actualHeight %actualHeight% `n endTurnX %endTurnX% `n HandStep %HandStep% `n BoardStep %BoardStep% `n endTurnX %endTurnX% `n
