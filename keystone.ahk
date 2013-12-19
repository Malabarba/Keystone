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

  ;; Options Button
  optionsX := 0.95
  optionsY := 0.95
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
  
  numberOfCombatRows := 5
  rowEnemyHero := 4
  rowEnemyMinions := 3
  rowPlayerMinions := 2
  rowPlayerHero := 1
  rowPlayerHand := 0
  
  combatButtonsPrepareRelativeVariables()  
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
  combatButtonsCalculateAbsoluteVariables()
  
  handStep       := handStep       * WindowWidth
  boardStep      := boardStep      * WindowWidth
  handRowY     := WindowY + handRowY     * WindowHeight
  enemyRowY    := WindowY + WindowHeight*(1 - friendlyRowY)
  friendlyRowY := WindowY + WindowHeight * friendlyRowY

  currentRow := rowPlayerMinions

  ;; Options Button
  optionsX := optionsX * actualWidth
  optionsY := optionsY * actualHeight
  concedeX := concedeX * actualWidth
  concedeY := concedeY * actualHeight
  
  endTurnX := WindowX + WindowWidth * EndTurnX
  endTurnY := WindowY + WindowHeight * endTurnY
}

calculateDimensions()

clickEndTurn() {  
  global
  move(endTurnX, endTurnY, 1, 0, 0)
  sleep 100
  moveToButton(0)
  calculateDimensions()
}

clickOptions() {  
  global
  move(optionsX, optionsY, 1, concedeX, concedeY)
}

;; move to X Y, click if DO, then move to AX AY
move(x,y,do,ax,ay) {  
  global
  MouseMove, %x%, %y%, 0, 
  if (do) {
    click()
    if (ax) {
      sleep 100
      MouseMove, %ax%, %ay%, 0,
    }
  }
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

moveHor(dir) {
  global currentRow, currentMenu
  if (currentMenu)
    menusMoveHor(dir)
  else
    moveRowTowards(currentRow,dir)
}
moveVer(dir) {
  global currentRow, currentMenu
  if (currentMenu)
    menusMoveVer(dir)
  else
    moveRowTowards(currentRow + dir,0)
} 
