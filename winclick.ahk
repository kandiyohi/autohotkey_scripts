#Warn
;SendMode Input
;SetWorkingDir %A_ScriptDir%
#SingleInstance Force

#RButton::
    MouseGetPos,,,MouseWin
    WinSet, Bottom,,ahk_id %MouseWin%
    Return
