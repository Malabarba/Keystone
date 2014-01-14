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
    cyclePosition := 0 ;; Hero Power
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
    move( heroIconX, heroIconY,0)
  }
  else if (pos = 1){
    currentRow := rowPlayerHero
    move( heroPowerX, heroPowerY,0)
  }
  else if (pos = 2){
    currentRow := rowEnemyHero
    move( enemyIconX, enemyIconY,0)
  }
}
