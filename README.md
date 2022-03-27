Hello, so if you all don't know me I go by TheCoderJT when it comes to coding. But, most people know me by TheNamesJT I do youtube in my off time and stream to twitch. I have been a fan of nutty for awhile now
and recently saw his video [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg)

It is a solid video! and many are happy with what he showed but, for me. I like having more control. So, I created a autohotkey script for windows users only that will run obs as admin, check how many backup zips we have inside our backup path we setup follow nutty's video, and if its higher then a value we set it will delete the oldest file and run nutty's create-backup.bat file which does a bunch of things you should already know.

Its hella convient and it saves you from having to go into the obs folder and running nutty's bat files manually which you still can do if you still desire to do that.

# Prerequisites

If you haven't follow this video by nutty [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg) this AHK will be useless to you. This script requires you to have his bat files and followed his video in order for this to work as intended. So if you haven't done that click the link above and follow his video. Then come back here and follow the instructions below.

# Disclaimer

I'm not held liable for your misuse of this script in anyway or if you enter incorrect paths and acidenally delete an important file on your machine. By dowloading this script, liablity and responsibility is tranfered to you. **Use At Your Own Risk**

# Getting Started!

1. Download the AHK script only copy and paste it inside your obs folder.
2. Once its inside the obs folder right click the autohotkey script and create shortcut.....drag the shortcut to the desktop. Then, Right click the script on the desktop and click edit you can use notepad or any IDE.
3. Now, you will need to change some values;

## Enter Your Backup Obs Folder Path You Used In create-backup.bat (backupDir)

You need to change the below path value to the folder path you used inside of nutty's create-backup.bat file to see this just right click create-backup.bat and edit that file and copy the backupDir value and use that path for the value below only copy and paste the text inside the double qoutes like belofe but with your path

<code>
obsSavedBackupPath := "F:\Obs-Studio Backup\Portable Obs Backup\Obs Backup Timestamps"
</code>

## Enter Your Obs Binary Folder Path (Only Need To Change If You Are Using 32Bit and If Your Obs Install Is Different)

Now change the obsPath value to your obs exe folder it will either be exactly like mine if your using the 64 bit obs client and if you didn't change the install location when installing obs. If that is the case you won't need to edit this value.

If your using the 32 bit client you will need to change it to "C:\Program Files\obs-studio\bin\32bit".

If you installed it into a different location you will need to locate your 32bit or 64bit path and then change it according.

<code>
obsPath := "C:\Program Files\obs-studio\bin\64bit"
</code>

## Set The Number Of Files Before Deletion

This value can be any value you want but, remember this will increase the file size of the backupfolder and it will make your google drive take up more space if you have this folder synced to google drive using the google drive desktop app. I woudn't set it higher then 11 which means you will always have 10 recent backups.

<code>
numberOfFilesBeforeDeletion := 2
</code>

## Set Which Obs Exe To Run

If your using the 32bit client you will need to change **obs64.exe** to **obs32.exe**. If your using the 64 bit client you won't need to change this value.

<code>
Run, *RunAs obs64.exe, %obsPath% 
</code>

## The Path To Nutty's Create-Backup.bat File

Make sure the path to nutty's create-backup.bat file is correct aka find it in your obs-studio folder and in the explorer window right click and copy the path as text and enter that in between the double qoutes. It had to be the right path or this won't run at all.

<code> Run, C:\Program Files\obs-studio\create-backup.bat</code>

# Congrats!

And thats it! you can simply double click the ahk shortcut it should be on the desktop. you will notice cmd or powershell open and then obs starts. Make sure not to close cmd or powershell untill its finished creating the backup this is nutty's script running.

It also may even close on its own it just takes longer to finish which means your obs it open and be loaded by the time the cmd finishes. So don't be alarmed! or panic thinking something is wrong. If you followed my instructions and entered your CORRECT PATHS this should work as potrayed.
