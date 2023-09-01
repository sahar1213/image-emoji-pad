

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



; image emoji slots paths

Global Slot0 := ImageEmojisFolderPath . "0.png"
Global Slot1 := ImageEmojisFolderPath . "1.png"
Global Slot2 := ImageEmojisFolderPath . "2.png"
Global Slot3 := ImageEmojisFolderPath . "3.png"
Global Slot4 := ImageEmojisFolderPath . "4.png"
Global Slot5 := ImageEmojisFolderPath . "5.png"
Global Slot6 := ImageEmojisFolderPath . "6.png"
Global Slot7 := ImageEmojisFolderPath . "7.png"
Global Slot8 := ImageEmojisFolderPath . "8.png"
Global Slot9 := ImageEmojisFolderPath . "9.png"

Global Slot10 := ImageEmojisFolderPath . "10.png"
Global Slot11 := ImageEmojisFolderPath . "11.png"
Global Slot12 := ImageEmojisFolderPath . "12.png"
Global Slot13 := ImageEmojisFolderPath . "13.png"
Global Slot14 := ImageEmojisFolderPath . "14.png"
Global Slot15 := ImageEmojisFolderPath . "15.png"
Global Slot16 := ImageEmojisFolderPath . "16.png"
Global Slot17 := ImageEmojisFolderPath . "17.png"
Global Slot18 := ImageEmojisFolderPath . "18.png"
Global Slot19 := ImageEmojisFolderPath . "19.png"

; hotkeys to write out image emojis

; right alt + numpad number, turn on num lock
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

; right ctrl + numpad number, turn on num lock
>^Numpad0:: PasteImage(Slot10)
>^Numpad1:: PasteImage(Slot11)
>^Numpad2:: PasteImage(Slot12)
>^Numpad3:: PasteImage(Slot13)
>^Numpad4:: PasteImage(Slot14)
>^Numpad5:: PasteImage(Slot15)
>^Numpad6:: PasteImage(Slot16)
>^Numpad7:: PasteImage(Slot17)
>^Numpad8:: PasteImage(Slot18)
>^Numpad9:: PasteImage(Slot19)

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
