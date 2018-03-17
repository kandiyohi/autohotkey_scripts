#SingleInstance force

global G_ClosePropertiesOnDone := true
global G_ShowInfoTrayTips := false

#F1::SoundActivate("Speakers","Realtek High Definition Audio")
#F2::SoundActivate("Headphones","SteelSeries Arctis 7 Game")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#F12::
G_ShowInfoTrayTips := !G_ShowInfoTrayTips
Return

SoundActivate(DesiredName1, DesiredName2)
{
	Run, mmsys.cpl
	WinWait, Sound ahk_exe rundll32.exe
	WinGet,SoundWindow,ID,Sound ahk_exe rundll32.exe
	SoundWindowID := "ahk_id" . SoundWindow
	ControlGet, MyList, List,,SysListView321, %SoundWindowID%
	Found := false
	Loop, Parse, MyList, `n  ; Rows are delimited by linefeeds (`n).
	{
		Name1 :=
		Name2 :=
		Status :=
		RowNumber := A_Index
		Loop, Parse, A_LoopField, %A_Tab%  ; Fields (columns) in each row are delimited by tabs (A_Tab).
		{
			If (A_Index = 1)
			{
				Name1 := A_LoopField
			}
			Else If (A_Index = 2)
			{
				Name2 := A_LoopField
			}
			Else If (A_Index = 3)
			{
				Status := A_LoopField
			}
		}
		If (Name1 = DesiredName1 and Name2 = DesiredName2)
		{
			Found := true
			If (Status = "Ready")
			{
				ControlSend, SysListView321,{Home}, %SoundWindowID%
				Loop,% RowNumber - 1
				{
					ControlSend, SysListView321,{Down}, %SoundWindowID%
				}
				ControlSend,Button2,{Down}d,%SoundWindowID%
				If (G_ShowInfoTrayTips)
				{
					TrayTip,SoundSwitch,Default is now %Name1%/%Name2%
				}
				;ControlSend,,{Tab}{Down}d,%SoundWindowID%
				;ControlFocus,Button 2,%SoundWindowID%
				;Send {Tab}
				;Send {Tab}
				;Sleep 1000
				;Send {Down 1}
				;Sleep 1000
				;Send d
			}
			Else if (Status = "Default Device")
			{
				If (G_ShowInfoTrayTips)
				{
					TrayTip,SoundSwitch,%Name1%/%Name2% is already default device.,0,2
				}
			}
			Else
			{
				TrayTip,SoundSwitch,Status is unexpected status: %Status%,0,3
			}
			;TrayTip,Info, Speaker is default.
		}
		;Else
		;{
		;}
	}
	
	If (!Found)
	{
		TrayTip,Warning,"Did not found device: %Name1%/%Name2%
	}

	if (G_ClosePropertiesOnDone)
	{
		Send {Esc}
	}
}
