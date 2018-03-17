#SingleInstance force

; It is recommended to run this as admin so admin-level windows can be played
; with.

; AHK parser doesn't do multiline well.  Reload the script whenever this is
; edited to find errors quickly and avoid heartbreak.
global Windows := {1: "ahk_exe powershell.exe"
	, 2: "ahk_exe Discord.exe"
	, 3: "ahk_exe firefox.exe"
	, 4: ""
	, 5: ""
	, 6: ""
	, 7: ""
	, 8: ""
	, 9: ""
	, 0: "ahk_exe Taskmgr.exe"
	, 1n: ""
	, 2n: ""
	, 3n: ""
	, 4n: ""
	, 5n: ""
	, 6n: ""
	, 7n: ""
	, 8n: ""
	, 9n: ""
	, 0n: "" }


;^!+r::Reload

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#1::FocusWindow("1")
#2::FocusWindow("2")
#3::FocusWindow("3")
#4::FocusWindow("4")
#5::FocusWindow("5")
#6::FocusWindow("6")
#7::FocusWindow("7")
#8::FocusWindow("8")
#9::FocusWindow("9")
#0::FocusWindow("0")

^#1::SetWindow("1")
^#2::SetWindow("2")
^#3::SetWindow("3")
^#4::SetWindow("4")
^#5::SetWindow("5")
^#6::SetWindow("6")
^#7::SetWindow("7")
^#8::SetWindow("8")
^#9::SetWindow("9")
^#0::
TrayTip,Warning,Cannot set task manager button.,0,2
Sleep 2000
TrayTip
Return

#Numpad1::FocusWindow("1n")
#Numpad2::FocusWindow("2n")
#Numpad3::FocusWindow("3n")
#Numpad4::FocusWindow("4n")
#Numpad5::FocusWindow("5n")
#Numpad6::FocusWindow("6n")
#Numpad7::FocusWindow("7n")
#Numpad8::FocusWindow("8n")
#Numpad9::FocusWindow("9n")
#Numpad0::FocusWindow("0n")

^#Numpad1::SetWindow("1n")
^#Numpad2::SetWindow("2n")
^#Numpad3::SetWindow("3n")
^#Numpad4::SetWindow("4n")
^#Numpad5::SetWindow("5n")
^#Numpad6::SetWindow("6n")
^#Numpad7::SetWindow("7n")
^#Numpad8::SetWindow("8n")
^#Numpad9::SetWindow("9n")
^#Numpad0::SetWindow("0n")

FocusWindow(slot)
{
	If (Windows[slot] <> "")
	{
		;Value := Windows[slot]
		WinActivate % Windows[slot]
	}
	Else
	{
		TrayTip,Window Focus,% "Failed for slot" . slot . ": " Windows[slot],0,2
		Sleep 2000
		TrayTip
	}
}

SetWindow(slot)
{
	WinGet,CurrentWindow,ID,A
	Windows[slot] := "ahk_id" . CurrentWindow
	TrayTip,Info,% "Set window " . slot . "=""" . Windows[slot]
	Sleep 2000
	TrayTip
}
