Hello, so if you all don't know me I go by TheCoderJT when it comes to coding. But, most people know me by TheNamesJT I do youtube in my off time and stream to twitch. I have been a fan of nutty for awhile now
and recently saw his video [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg)

It is a solid video! and many are happy with what he showed but, for me. I like having more control. So, I created a autohotkey script for windows users only that will run obs as admin, check how many backup zips we have inside our backup path we setup follow nutty's video, and if its higher then a value we set it will delete the oldest file and run nutty's create-backup.bat file which does a bunch of things you should already know.

Its hella convient and it saves you from having to go into the obs folder and running nutty's bat files manually which you still can do if you still desire to do that.

# Prerequisites

If you haven't follow this video by nutty [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg) this AHK will be useless to you. This script requires you to have his bat files and followed his video in order for this to work as intended. So if you haven't done that click the link above and follow his video. Then come back here and follow the instructions below.

# Disclaimer

I'm not held liable for your misuse of this script in anyway or if you enter incorrect paths and acidenally delete an important file on your machine. By dowloading this script, liablity and responsibility is tranfered to you. **Use At Your Own Risk**

# Getting Started!

1. **Download the AHK script** and **put it inside your obs folder**. I would **name it Obs** since we plan on replacing the actual obs shortcut with it and running obs by running this autohotkey script.
2. Right click the script and click edit either in notepad or in any IDE you use....I used vscode but, notepad will work.
3. You will need to change some values.
   1. obsSavedBackupPath you need to change this to the folder path you used inside of nutty's create-backup.bat file to see this just right click and edit that file and copy the backupDir value (don't cut or remove it just copy it) the value is the text surounded by double quoutes.
   2. Once you copied that go back to the notepad where your editing the authotkey script and replace "F:\Obs-Studio Backup\Portable Obs Backup\Obs Backup Timestamps" with the one you just copied. make sure that yours looks like mine above in terms of the path being surrounded by doubl qoutes "path".
   3. Now change the obsPath value to your obs exe folder it will either be exactly like mine if your using the 64 bit obs client and if you didn't change the install location when installing obs if that is the case you won't need to edit this value. If your using the 32 bit client you will need to change it to "C:\Program Files\obs-studio\bin\32bit". If you installed it into a different location you will need to location the 32bit or 64but path and then change it according.
   4. numberOfFilesBeforeDeletion this value can be any value you want but, remember this will increase the file size of the backupfolder and it will make your google drive take up more space if you have this folder synced to google drive using the google drive desktop app. I woudn't set it higher then 11 which means you will always have 10 recent backups.
   5. If your using the 32bit client you will need to change **obs64.exe** which is location <code>Run, \*RunAs obs64.exe, %obsPath% ; Make sure to change the obs64.exe </code> you would need to change it to **obs32.exe**. If your using the 64 bit client you won't need to change this value.
   6. At the end of the script you will see <code> Run, C:\Program Files\obs-studio\create-backup.bat</code> make sure the path for the create-backup.bat file is correct or this won't run at all. This should not be wrapped in double qoutes!.

And thats it! you can simply double click the ahk shortcut it should be on the desktop. you will notice cmd or powershell open and then obs starts. Make sure not to close cmd or powershell untill its finished creating the backup this is nutty's script running.

It also may even close on its own it just takes longer to finish which means your obs it open and be loaded by the time the cmd finishes. So don't be alarmed! or panic thinking something is wrong. If you followed my instructions and entered your CORRECT PATHS this should work as potrayed.
