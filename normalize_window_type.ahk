#SingleInstance Force

^+!n::
TrayTip, MyTitle, Testing, 0, 1
return

^+!g::
Try
{
	DetectHiddenWindows, Off
	WinGet, ActiveWindow, ProcessName, A
	WinGet, Windows, List, ahk_exe %ActiveWindow%

	; The number here never seems to line up with how many windows are actually
	; moved.
	TrayTip, MyTitle, Moving %Windows% windows., 0, 1
	Loop,%Windows%
	{
		;TrayTip, Debug, %WindowId% = %WindowTitle%`, winx=%WindowX%`, winy=%WindowY%
		WindowId := "ahk_id " . Windows%A_Index%
		WinActivate, %WindowId%
		WinGetTitle, WindowTitle, %WindowId%
		WinGetClass, WindowClass, %WindowId%
		; Skip taskbar on other monitors.
		If (WindowClass == "Shell_SecondaryTrayWnd") {
			Continue
		}
		WinGetPos, WindowX, WindowY, WindowWidth, WindowHeight, %WindowId%
		; Calculate where to put the top left corner for easy closing of
		; multiple windows.
		X := A_ScreenWidth - WindowWidth
		Y := 0
		WinMove, %WindowId%,, %X%, %Y%
	}
	TrayTip, MyTitle, Moved %Windows% windows., 0, 1
}
Catch e
{
	TrayTip, Error, %e%, 0, 2
}
return
