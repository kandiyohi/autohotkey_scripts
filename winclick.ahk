#Warn
#SingleInstance Force

global G_LastWindowTouched := "None"
global G_LastCommand := "None"

#/::
    MsgBox,Last Info,ahk_id %G_LastWindowTouched% with action %G_LastCommand%.
    Return

#z::
    If (G_LastWindowTouched != "None") {
        If (G_LastCommand == "Minimize") {
            WinRestore,ahk_id %G_LastWindowTouched%
            ; Some windows don't Top themselves on WinActivate.  Notably PowerShell.
            WinActivate,ahk_id %G_LastWindowTouched%
            WinSet,Top,,ahk_id %G_LastWindowTouched%
        }
        Else If (G_LastCommand == "ToBack") {
            WinActivate,ahk_id %G_LastWindowTouched%
            ; Some windows don't Top themselves on WinActivate.  Notably PowerShell.
            WinSet,Top,,ahk_id %G_LastWindowTouched%
        }
        Else {
            MsgBox,Error,Don't know how to undo command %G_LastCommand%.
        }
    }
    Return

#LButton::
    MouseGetPos,,,MouseWin
    WinMinimize, ahk_id %MouseWin%
    G_LastWindowTouched := MouseWin
    G_LastCommand := "Minimize"
    Return

#RButton::
    MouseGetPos,,,MouseWin
    WinSet, Bottom,,ahk_id %MouseWin%
    G_LastWindowTouched := MouseWin
    G_LastCommand := "ToBack"
    Return
