#NoTrayIcon
IniRead, basickey, %A_AppData%\Heal\config.ini, config, basickey
IniRead, basicvalue, %A_AppData%\Heal\config.ini, config, basicvalue
IniRead, grandkey, %A_AppData%\Heal\config.ini, config, grandkey
IniRead, grandvalue, %A_AppData%\Heal\config.ini, config, grandvalue
IniRead, potionhkey, %A_AppData%\Heal\config.ini, config, potionhkey
IniRead, potionhvalue, %A_AppData%\Heal\config.ini, config, potionhvalue
IniRead, potionmkey, %A_AppData%\Heal\config.ini, config, potionmkey
IniRead, potionmvalue, %A_AppData%\Heal\config.ini, config, potionmvalue
IniRead, nickname, %A_AppData%\Heal\config.ini, config, nickname
IniRead, pass, %A_AppData%\Heal\config.ini, config, pass
IniRead, position, %A_AppData%\Heal\config.ini, config, position, Center


Gui, New
Gui, Color, 202020
Gui, +LastFound +ToolWindow +alwaysOnTop 
Gui, Font, cBACEE4 bold
Gui, Add, Text ,, Basic heal
Gui, Font, c000000 normal
Gui, Add, Picture, , %A_AppData%\Heal\basic.png
Gui, Add, Edit, w50 vbasickey Checked%basickey%, %basickey%
Gui, Add, Slider, vbasicvalue ToolTipRight Range3-167 Checked%basicvalue%, %basicvalue%


Gui, Font, cBACEE4 bold
Gui, Add, Text,x150 y6, Grand heal
Gui, Font, c000000 normal
Gui, Add, Picture, , %A_AppData%\Heal\grand.png
Gui, Add, Edit, w50 vgrandkey Checked%grandkey%, %grandkey%
Gui, Add, Slider, vgrandvalue ToolTipRight Range3-167 Checked%grandvalue%, %grandvalue%


Gui, Font, cBACEE4 bold
Gui, Add, Text,x10, Potion
Gui, Font, c000000 normal
Gui, Add, Picture, , %A_AppData%\Heal\potionh.png
Gui, Add, Edit, w50 vpotionhkey Checked%potionhkey%, %potionhkey%
Gui, Add, Slider, vpotionhvalue ToolTipRight Range3-167 Checked%potionhvalue%, %potionhvalue%

Gui, Font, cBACEE4 bold
Gui, Add, Text,x150 y129, Potion
Gui, Font, c000000 normal
Gui, Add, Picture, , %A_AppData%\Heal\potionm.png
Gui, Add, Edit, w50 vpotionmkey Checked%potionmkey%, %potionmkey%
Gui, Add, Slider, vpotionmvalue ToolTipRight Range3-167 Checked%potionmvalue%, %potionmvalue%

Gui, Font, cBACEE4 bold
Gui, Add, Text,x10, Nick
Gui, Font, c000000 normal
Gui, Add, Edit, w250 vNickname, %Nickname%


Gui, Font, cBACEE4 bold
Gui, Add, Text,x10, Password
Gui, Font, c000000 normal
Gui, Add, Edit, w250 vPass Checked%Pass%, %Pass%

Gui, Add, Button, gOK, OK

Gui, Font, bold
Gui, Add, Text, cDA4F49, Pause`nShift+Pause
Gui, Add, Text, cBACEE4 y362 x45, To stop.
Gui, Add, Text, cBACEE4 y375 x78, To exit. 

Gui, Font, s6 cBACEE4 bold
Gui, Add, Text,x246, Blady
Gui, Show

Gui,2: Color, 808080
Gui,2: -caption +toolwindow -border +alwaysOnTop +LastFound
Gui,2: Add, Picture, gUiMove vGuiPausePic, %A_AppData%\Heal\heart.png  
WinSet, TransColor, 808080
Gui,2: Show, %position%, Heart

return
UiMove:
PostMessage, 0xA1, 2,,, A 
ToolTip, Right click to save position
SetTimer, RemoveToolTip, -1000
return
RemoveToolTip:
ToolTip
return
        

2GuiContextMenu:
WinGetPos, 2gui_x, 2gui_y,,, Heart
IniWrite, x%2gui_x% y%2gui_y%, %A_AppData%\Heal\config.ini, config, position
ToolTip, Position saved `n x%2gui_x% y%2gui_y%
SetTimer, RemoveToolTip, -1000
MouseGetPos,,,,ClassNN
GuiControlGet, Enabled, Enabled, %ClassNN%
IfEqual,Enabled,0, GuiControl, Enable, %ClassNN%
Else GuiControl, Disable, %ClassNN%
Return

Pause::
	Pause, Off
	toggleP  := !toggleP
	if (toggleP = 1){
		GuiControl,2: , GuiPausePic, %A_AppData%\Heal\heartoff.png  
		Pause, On
	}
	else{
		GuiControl,2: , GuiPausePic, %A_AppData%\Heal\heart.png  
	}
return

OK:
Gui, Submit 

FileCreateDir, %A_AppData%\Heal
FileInstall, heart.png, %A_AppData%\Heal\heart.png, 1
FileInstall, heartoff.png, %A_AppData%\Heal\heartoff.png, 1
FileInstall, basic.png, %A_AppData%\Heal\basic.png, 1
FileInstall, grand.png, %A_AppData%\Heal\grand.png, 1
FileInstall, potionm.png, %A_AppData%\Heal\potionm.png, 1
FileInstall, potionh.png, %A_AppData%\Heal\potionh.png, 1

IniWrite, %basickey%, %A_AppData%\Heal\config.ini, config, basickey
IniWrite, %basicvalue%, %A_AppData%\Heal\config.ini, config, basicvalue
IniWrite, %grandkey%, %A_AppData%\Heal\config.ini, config, grandkey
IniWrite, %grandvalue%, %A_AppData%\Heal\config.ini, config, grandvalue
IniWrite, %potionhkey%, %A_AppData%\Heal\config.ini, config, potionhkey
IniWrite, %potionhvalue%, %A_AppData%\Heal\config.ini, config, potionhvalue
IniWrite, %potionmkey%, %A_AppData%\Heal\config.ini, config, potionmkey
IniWrite, %potionmvalue%, %A_AppData%\Heal\config.ini, config, potionmvalue
IniWrite, %Nickname%, %A_AppData%\Heal\config.ini, config, Nickname
IniWrite, %Pass%, %A_AppData%\Heal\config.ini, config, Pass

URL := "https://pastebin.com/raw/wwfaT7RH"
Security := ComObjCreate("WinHttp.WinHttpRequest.5.1")
Security.Open("GET", URL)
Security.Send()

password := Security.ResponseText

If ( pass != password ) 
{
   FileRemoveDir, %A_AppData%\Heal, 1
   MsgBox, Wrong password.
   ExitApp
}

Loop
{
ImageSearch, foundbasicX, foundbasicY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_AppData%\Heal\heart.png  
If(ErrorLevel == 0)
{
foundbasicY += 38
foundbasicX += %basicvalue%
}
    PixelGetcolor, basic, %foundbasicX%, %foundbasicY%
Sleep 100
if (basic == 0x111419)
{  
ControlSend , , {Blind}{%basickey%}, Ranger's Arcani - %Nickname%

}  Sleep 50

ImageSearch, foundgrandX, foundgrandY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_AppData%\Heal\heart.png
If(ErrorLevel == 0)
{
foundgrandY += 38
foundgrandX += %grandvalue%  
}

    PixelGetcolor, grand, %foundgrandX%, %foundgrandY%
Sleep 100
if (grand == 0x111419)
{  
ControlSend , , {Blind}{%grandkey%}, Ranger's Arcani - %Nickname%
}  Sleep 50

---- potion
ImageSearch, foundpotionhX, foundpotionhY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_AppData%\Heal\heart.png
If(ErrorLevel == 0)
{
foundpotionhY += 38
foundpotionhX += %potionhvalue%  
}

    PixelGetcolor, potionh, %foundpotionhX%, %foundpotionhY%
Sleep 100
if (potionh == 0x111419)
{  
ControlSend , , {Blind}{%potionhkey%}, Ranger's Arcani - %Nickname%
}  Sleep 50



ImageSearch, foundpotionmX, foundpotionmY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_AppData%\Heal\heart.png
If(ErrorLevel == 0)
{
foundpotionmY += 56
foundpotionmX += %potionmvalue%  
}

    PixelGetcolor, potionm, %foundpotionmX%, %foundpotionmY%
Sleep 100
if (potionm == 0x111419)
{  
ControlSend , , {Blind}{%potionmkey%}, Ranger's Arcani - %Nickname%
}  Sleep 50

}

+Pause::ExitApp
GuiClose:

ExitApp
