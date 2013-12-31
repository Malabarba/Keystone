; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
;

combatButtonsPrepareRelativeVariables() {
  global  
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
}

combatButtonsCalculateAbsoluteVariables() {
  global  
  heroPowerX     := WindowX + WindowWidth * heroPowerX
  heroPowerY     := WindowY + WindowHeight * heroPowerY
  heroIconX      := WindowX + WindowWidth * heroIconX
  heroIconY      := WindowY + WindowHeight * heroIconY
  enemyIconX     := WindowX + WindowWidth * enemyIconX
  enemyIconY     := WindowY + WindowHeight * enemyIconY

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
  }
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
