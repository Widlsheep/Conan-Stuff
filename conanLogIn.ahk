; -------------------------------------------------------------
; AutoHotkey v1 Script: Click Sequence Recorder and Executor
;
; Instructions:
; 1. Hover your mouse over a desired location and press:
;       - 1 to record Position 1
;       - 2 to record Position 2
;       - 3 to record Position 3
;
; 2. Press 4 to toggle the automated clicking loop on/off.
; 3. Press Esc at any time to exit the script.
; -------------------------------------------------------------

; Initialize positions and state.
pos1_x := 0
pos1_y := 0
pos2_x := 0
pos2_y := 0
pos3_x := 0
pos3_y := 0
isRunning := false

; -------------------------------------------------------------
; Hotkeys to record the positions
; -------------------------------------------------------------
1::
    MouseGetPos, pos1_x, pos1_y
    ToolTip, lil Sheep scrit -> Position 1 recorded at %pos1_x%, %pos1_y%
    SetTimer, RemoveToolTip, -1000
return

2::
    MouseGetPos, pos2_x, pos2_y
    ToolTip, Position 2 recorded at %pos2_x%, %pos2_y%
    SetTimer, RemoveToolTip, -1000
return

3::
    MouseGetPos, pos3_x, pos3_y
    ToolTip, Position 3 recorded at %pos3_x%, %pos3_y%
    SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
    ToolTip
return

; -------------------------------------------------------------
; Hotkey to toggle the clicking loop (P)
; -------------------------------------------------------------
4::
    isRunning := !isRunning
    if (isRunning) {
        ToolTip, Clicking loop started...
        SetTimer, RemoveToolTip, -1000
        ; Start the timer that runs the click sequence.
        SetTimer, ClickSequence, 0
    }
    else {
        ToolTip, Clicking loop stopped.
        SetTimer, RemoveToolTip, -1000
        SetTimer, ClickSequence, Off
    }
return

; -------------------------------------------------------------
; The click sequence loop
; -------------------------------------------------------------
ClickSequence:
    ; Ensure all positions have been set.
    if (pos1_x = 0 and pos1_y = 0) {
        ToolTip, Position 1 not set! Press 1 to record.
        SetTimer, RemoveToolTip, -1000
        return
    }
    if (pos2_x = 0 and pos2_y = 0) {
        ToolTip, Position 2 not set! Press 2 to record.
        SetTimer, RemoveToolTip, -1000
        return
    }
    if (pos3_x = 0 and pos3_y = 0) {
        ToolTip, Position 3 not set! Press 3 to record.
        SetTimer, RemoveToolTip, -1000
        return
    }

    ; Click at Position 1 and wait 2 seconds.
    MouseClick, left, pos1_x, pos1_y
    Sleep, 2000

    ; Click at Position 2 and wait 7 seconds.
    MouseClick, left, pos2_x, pos2_y
    Sleep, 7000

    ; Click at Position 3 and wait 1 second.
    MouseClick, left, pos3_x, pos3_y
    Sleep, 1000
return

; -------------------------------------------------------------
; Hotkey to exit the script
; -------------------------------------------------------------

Esc::ExitApp
