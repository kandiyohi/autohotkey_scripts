#Warn
#SingleInstance Force

#RButton::
    MouseGetPos,,,MouseWin
    WinSet, Bottom,,ahk_id %MouseWin%
    Return
