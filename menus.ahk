; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Artur Malabarba <bruce.connor.am@gmail.com>
;

;; The following parameters all represent a fraction of the width or
;; height. i.e., a value of 0.9, means 0.9*WindowWidth. Let me know if
;; you need to change this.

menusPrepareRelativeVariables() {
  global  

  ;; Arena Mode Buttons
  arenaModePlayButtonX := 0.62
  arenaModePlayButtonY := 0.77
  arenaModeCard1Y      := 
  arenaModeCard1X      := 
  arenaModeCard2Y      := 
  arenaModeCard2X      := 
  arenaModeCard3Y      := 
  arenaModeCard3X      :=
  
  ;; Play Mode Buttons
  playModePlayButtonX   := 0.8
  playModePlayButtonY   := 0.78
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
  arenaModeButtonY    := 0.448
  
}

menusCalculateAbsoluteVariables() {
  global
  
  arenaModePlayButtonX := WindowX + WindowWidth * arenaModePlayButtonX
  arenaModePlayButtonY := WindowY + WindowHeight * arenaModePlayButtonY
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
  
}

