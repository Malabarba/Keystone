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

#Import menu.ahk
#Import binds.ahk
#Import binds-intrusive.ahk
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
  
  menusPrepareRelativeVariables()  
  
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

  menusCalculateAbsoluteVariables()  
  
  heroPowerX     := WindowX + WindowWidth * heroPowerX
  heroPowerY     := WindowY + WindowHeight * heroPowerY
  heroIconX      := WindowX + WindowWidth * heroIconX
  heroIconY      := WindowY + WindowHeight * heroIconY
  enemyIconX     := WindowX + WindowWidth * enemyIconX
  enemyIconY     := WindowY + WindowHeight * enemyIconY
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
    cycleButtonsRow(row,dir)
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
      MsgBox, yMovement %yMovement% `n xMovement %xMovement% `n currentRow %currentRow% `n row %row% 
    currentRow := row
  }
}

cycleButtonsRow(row,dir) {
  global  
  ;; Assumes it was given a button row
  if (row = currentRow)
    cycleButtons(dir)
  else {
    if (row = rowEnemyHero)
      moveToButton(2)
    else 
      moveToButton(1)
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
  ;; if (GetKeyState("Control"))
    ;; MsgBox, cyclePosition  
  moveToButton(cyclePosition)
}

isButtonRow(row) {
  global   
  return (row = rowEnemyHero) || (row = rowPlayerHero)
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


