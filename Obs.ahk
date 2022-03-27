#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; You need to change the below path value to the folder path 
; you used inside of nutty's create-backup.bat file to see this 
; just right click create-backup.bat and edit that file and copy 
; the backupDir value and use that path for the value below only 
; copy and paste the text inside the double qoutes like below but 
; with your path

obsSavedBackupPath := "F:\Obs-Studio Backup\Portable Obs Backup\Obs Backup Timestamps"

;-------------

; Now change the obsPath value to your obs exe folder it will either 
; be exactly like mine if your using the 64 bit obs client and if you 
; didn't change the install location when installing obs. If that is 
; the case you won't need to edit this value.

obsPath := "C:\Program Files\obs-studio\bin\64bit"

;-------------



; This value can be any value you want but, remember this will increase 
; the file size of the backupfolder and it will make your google drive 
; take up more space if you have this folder synced to google drive using 
; the google drive desktop app. I woudn't set it higher then 11 which means
; you will always have 10 fresh recent backups.

numberOfFilesBeforeDeletion := 2

;--------------

; DON'T CHANGE THESE
count := 0
old := ""
;-------------

; If your using the 32bit client you will need to change obs64.exe to obs32.exe. 
; If your using the 64 bit client you won't need to change this value.

Run, *RunAs obs64.exe, %obsPath% 
;--------------


; DON'T CHANGE THESE
Loop Files, %obsSavedBackupPath%\*.zip,,
{
  count++
  __files .= A_LoopFileFullPath "`n`n" 
  If (!old || (A_LoopFileTimeCreated < old)){
    oldestFile := A_LoopFileFullPath, old := A_LoopFileTimeCreated
  }
}
;--------------

; DON'T CHANGE THESE
if(count > numberOfFilesBeforeDeletion){
  FileDelete, %oldestFile%
}
;---------------


; Make sure the path to nutty's create-backup.bat file is correct aka find 
; it in your obs-studio folder and in the explorer window right click and 
; copy the path as text and enter that in between the double qoutes. It had 
; to be the right path or this won't run at all.

Run, C:\Program Files\obs-studio\create-backup.bat
;--------------
