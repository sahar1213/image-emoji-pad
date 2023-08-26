

; Change this path to wherever you placed your ImageEmojis folder plus a \ at the end
Global ImageEmojisFolderPath := "C:\ImageEmojis\"

; Change this path to wherever you placed your gdip.ahk script (by default it is placed in the ImageEmojis folder)
#Include C:\ImageEmojis\gdip.ahk
; an ahk library allowing this script to copy and paste images, allowing it to paste image emojis




#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force ; Prevent multiple instances of this script



; image emoji slots

; the names of the image files
Global Slot0 := "0.png"
Global Slot1 := "1.png"
Global Slot2 := "2.png"
Global Slot3 := "3.png"
Global Slot4 := "4.png"
Global Slot5 := "5.png"
Global Slot6 := "6.png"
Global Slot7 := "7.png"
Global Slot8 := "8.png"
Global Slot9 := "9.png"

; add the image emojis folder path to the names of the image files to form the full path
Global Slot0 := ImageEmojisFolderPath . Slot0
Global Slot1 := ImageEmojisFolderPath . Slot1
Global Slot2 := ImageEmojisFolderPath . Slot2
Global Slot3 := ImageEmojisFolderPath . Slot3
Global Slot4 := ImageEmojisFolderPath . Slot4
Global Slot5 := ImageEmojisFolderPath . Slot5
Global Slot6 := ImageEmojisFolderPath . Slot6
Global Slot7 := ImageEmojisFolderPath . Slot7
Global Slot8 := ImageEmojisFolderPath . Slot8
Global Slot9 := ImageEmojisFolderPath . Slot9

; hotkeys to write out image emojis (right alt + numpad number, turn on num lock)

>!Numpad0:: PasteImage(Slot0)
>!Numpad1:: PasteImage(Slot1)
>!Numpad2:: PasteImage(Slot2)
>!Numpad3:: PasteImage(Slot3)
>!Numpad4:: PasteImage(Slot4)
>!Numpad5:: PasteImage(Slot5)
>!Numpad6:: PasteImage(Slot6)
>!Numpad7:: PasteImage(Slot7)
>!Numpad8:: PasteImage(Slot8)
>!Numpad9:: PasteImage(Slot9)

; function to paste an image from an image file
PasteImage(filePath)
{
	clipSnapshot := Clipboard ; keep a snapshot of the clipboard
	
	; copy the image file into clipboard
	
	pToken := Gdip_Startup()
	Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(filePath)) ; convert the image into bitmap and copy into clipboard
	Gdip_DisposeImage(pBitmap) ; delete the bitmap
	Gdip_Shutdown(pToken)
	
	;Clipwait, 5 ; wait for clipboard to contain data with a 5 second timeout
	
	Send ^v ; paste image
	
	Sleep, 100
	
	Clipboard := clipSnapshot ; set clipboard back to snapshot value
}