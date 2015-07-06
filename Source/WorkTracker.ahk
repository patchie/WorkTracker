#NoEnv
#SingleInstance, Force
#NoTrayIcon
SetWorkingDir, %A_ScriptDir%
OnMessage(0x404, "AHK_NOTIFYICON")	;When you doubleclick on the systemtray icon, show the gui.
OnExit, GuiClose
Menu, Tray, Icon, icon.ico
Menu, Tray, Icon
;GoSub, Settings_load	;Load from settings.ini
;GoSub, Registry_load	;Load from registry
(StartUp_GUI=1)?AHK_NOTIFYICON(0,515)
return

AHK_NOTIFYICON(wParam, lParam)
{ 	global
	if (lParam = 515)
	{ 	ToolTip
	    if not (WinExist("ahk_id " GuiID))	;Only create the gui one time, not each time you wanna see it
		{ 	Gui, +hwndGuiID
			Gui, Add, Text, x310 y395, Made by Patchie and r4nd0m1
		    Gui, Add, Tab, x-2 y-3 w480 h390, Statistics|Settings|Howto
			Gui, Tab, 1
				Gui, Add, ListView, xp+7 yp+30 wp-40 r10 Checked Grid AltSubmit -Multi -NoSortHdr vLV, Date|Hours|Overtime
			Gui, Tab, 2
				Gui, Add, Text, x6 y26 w450 h260 , You will be able to change when you want to be notified to go to lunch, and when to go home. You should also be able to choose how many hours you normally work before getting overtime.
			Gui, Tab, 3
				Gui, Add, Text, x6 y26 w450 h260 , The WorkTracker will count hours you are logged into your computer`, and notify you when its time to go to lunch and when you should go home.
		}
		Gui, Show, x10 y10 w460 h410, WorkTracker
		;GuiControl, Focus, Edit1
		;Send, {End}^a
		return false
	}
}






GuiClose:
ExitApp