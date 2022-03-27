#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Step 1: Have this script file in the obs-studio folder name the autohotkey script Obs create shortcut and move it to desktop. So you run this like you would of with the obs shortcut this replaces that. 

; The Main Folder The Obs Backup Zip Files this is the same path as inside the create-backup.bat file. 
obsSavedBackupPath := "F:\Obs-Studio Backup\Portable Obs Backup\Obs Backup Timestamps"

; The obs exe location w.e one you use use 32bit if you run 32bit obs
obsPath := "C:\Program Files\obs-studio\bin\64bit"

; Think of this as a min number of backups in the logic below once count is higher then this number the logic will delete the oldest file. Example: its set to 3 at default so once you have 4 backups it will delete the oldest one so you will only have 3 backups if you set this to like 5 once you create a 6th backup it will delete the oldest one and you will have 5 backups.
numberOfFilesBeforeDeletion := 2

; Don't modify these below
count := 0
old := ""
;-----

; This runs obs as admin if your getting an error here you may have to google a solution for your use case.
Run, *RunAs obs64.exe, %obsPath% ; Make sure to change the obs64.exe to w.e binary you guys are running it either obs32.exe or obs64.exe


; This loops through all backup zips and deletes the oldest one so 
Loop Files, %obsSavedBackupPath%\*.zip,,
{
  count++
  __files .= A_LoopFileFullPath "`n`n" 
  If (!old || (A_LoopFileTimeCreated < old)){
    oldestFile := A_LoopFileFullPath, old := A_LoopFileTimeCreated
  }
}

; If the number of backup zip files exceed the numberOfFilesBeforeDeletion then it will delete the oldest file and then creates another backup screen by running nutty's bat file 
if(count > numberOfFilesBeforeDeletion){
  FileDelete, %oldestFile%
}

;This runs nutty's create-backup.bat file which creates the zipped obs backup
Run, C:\Program Files\obs-studio\create-backup.bat
