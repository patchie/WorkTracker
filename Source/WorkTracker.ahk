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
howtotext:="The WorkTracker will count hours you are logged into your computer`, and notify you when its time to go to lunch and when you should go home."
StartUp_GUI=1
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
				Gui, Add, ListView, xp+7 yp+30 wp-40 r10 Checked Grid AltSubmit -Multi -NoSortHdr vLV, Date|Hours|Overtime|Project
			Gui, Tab, 2
				Gui, Font, w700
				Gui, Add, GroupBox, x10 y30 w430 h190, General
				Gui, Font, w400
				Gui, Add, Text, x20 y50 w90 h20, Office Hours from:
				Gui, Add, Edit, x110 y50 w40 h20 -Multi +Center, 08:00
				Gui, Add, Text, x160 y50 w20 h20, To:
				Gui, Add, Edit, x190 y50 w40 h20 -Multi +Center, 16:00
				Gui, Add, Checkbox, x240 y50 w120 h20, Enable notification at
				Gui, Add, Edit, x370 y50 w40 h20 -Multi +Center, 15:45
				Gui, Add, Text, x20 y80 w80 h20, Lunchtime from:
				Gui, Add, Edit, x110 y80 w40 h20 -Multi +Center, 11:00
				Gui, Add, Text, x160 y80 w20 h20, To:
				Gui, Add, Edit, x190 y80 w40 h20 -Multi +Center, 11:30
				Gui, Add, Checkbox, x240 y80 w120 h20, Enable notification at
				Gui, Add, Edit, x370 y80 w40 h20 -Multi, 10:55
				Gui, Add, Checkbox, x20 y110 w270 h20, Notify me to record workhours every friday at 14:00
				Gui, Add, Checkbox, x20 y130 w120 h20, Record project time
				Gui, Add, Checkbox, x20 y150 w240 h20, Notify me when i got a full day and can leave
				Gui, Add, Checkbox, x20 y170 w390 h20, Notify me when i get to work`, with the time when i can go home.
				Gui, Font, w700
				Gui, Add, GroupBox, x10 y230 w430 h150, Projects
				Gui, Font, w400
				Gui, Add, Text, x20 y250 w90 h20, New project name:
				Gui, Add, Edit, x120 y250 w100 h20 -Multi, New Projectname
			Gui, Tab, 3
				Gui, Add, Text, x6 y26 w450 h260 , % howtotext
		}
		Gui, Show, w460 h410, WorkTracker
		return false
	}
}


GuiClose:
ExitApp