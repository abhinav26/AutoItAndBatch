
; Script to get all URLs from Firefox(or IE if Firefox is not open)
; Assumed that urls are unique
Local $file = FileOpen("test.txt", 2)
if WinExists("[CLASS:Chrome_WidgetWin_1]") Then
   WinActivate("[CLASS:Chrome_WidgetWin_1]")
EndIf
sleep (200)

If WinExists("[CLASS:MozillaUIWindowClass]") Then
   WinActivate("[CLASS:MozillaUIWindowClass]")
ElseIf WinExists("[CLASS:Chrome_WidgetWin_1]") Then
   WinActivate("[CLASS:Chrome_WidgetWin_1]")
ElseIf WinExists("[CLASS:IEFrame]") Then
   WinActivate("[CLASS:IEFrame]")
EndIf
Dim $links 
Sleep(100)
send ("!d")
send ("^c")
sleep(150)
Dim $first = ClipGet()
Dim $latest
While $latest <> $first
   send ("^{TAB}")
   send ("!d")
   send ("^c")
   Sleep(150)
   $latest = ClipGet()
   FileWriteLine($file, $latest)
WEnd   

