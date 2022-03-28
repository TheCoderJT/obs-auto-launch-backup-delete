Hello, so if you all don't know me I go by TheCoderJT when it comes to coding. But, most people know me by TheNamesJT I do youtube in my off time and stream to twitch. I have been a fan of nutty for awhile now
and recently saw his video [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg)

It is a solid video! and many are happy with what he showed but, for me. I like having more control. So, I created a autohotkey script for windows users only that will run obs as admin, check how many backup zips we have inside our backup folder, and if the number of saved backupss is higher then a value we set it will delete the oldest file and run nutty's create-backup.bat file which does a bunch of things you should already know like creating a new backup among other things.

Its hella convient and it saves you from having to go into the obs folder and running nutty's bat files manually which you still can do if you still desire to do that.

# Prerequisites

If you haven't follow this video by nutty [Backup ALL Your OBS Settings - Never Lose Your Settings Again!](https://youtu.be/imPH4YzBaZg) this AHK will be useless to you. This script requires you to have his bat files and followed his video in order for this to work as intended. So if you haven't done that click the link above and follow his video. Then come back here and follow the instructions below.

# Disclaimer

I'm not held liable for your misuse of this script in anyway or if you enter incorrect paths and acidenally delete an important file on your machine. By dowloading this script, liablity and responsibility is tranfered to you. **Use At Your Own Risk**

# Getting Started!

1. Firstly if you don't have ahk installed best [Install AHK](https://www.autohotkey.com/)
2. Then, Download the AHK script from github paste it inside your obs folder.
3. Once its inside the obs folder right click the autohotkey script and create shortcut.....drag the shortcut to the desktop. Then, Right click the script on the desktop and click edit you can use notepad or any IDE.
4. Now, you will need to change some values inside the script - <span color="red"> Make Sure To Save The File Once Your Done Making Changes </span>

## Enter Your Backup Obs Folder Path You Used In create-backup.bat (backupDir)

You need to change the below path value to the folder path you used inside of nutty's create-backup.bat file to see this just right click create-backup.bat and edit that file and copy the backupDir value and use that path for the value below only copy and paste the text inside the double qoutes like belofe but with your path

<code>
obsSavedBackupPath := "F:\Obs-Studio Backup\Portable Obs Backup\Obs Backup Timestamps"
</code>

## Enter Your Obs Binary Folder Path (Only Need To Change If You Are Using 32Bit and If Your Obs Install Is Different)

Now change the obsPath value to your obs exe folder it will either be exactly like mine if your using the 64 bit obs client and if you didn't change the install location when installing obs. If that is the case you won't need to edit this value.

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

Make sure the path to nutty's create-backup.bat file is correct aka find it in your obs-studio folder and in the explorer window right click and copy the path as text and replace my path to the right of the comma with the one you copied.

<code> Run, C:\Program Files\obs-studio\create-backup.bat</code>

# Congrats!

Thats it!

Now whenever you want to record or go live just run that script and it will open obs as admin, delete the oldest backup and create a new backup so you will always be backing up your obs.

### Bonus: Google Drive Desktop App

You only need this if your really worried. The google drive desktop app lets you sync a folder to google drive so it will constantly be syncing your backups to google drive.

This is mainly why limiting the amount of backups is a good thing because if you don't your space will get used up pretty quickly so limiting it will make it so you don't have to buy space and you can still stay below 15gb.

If your interested in this its pretty straight forward [Install Google Desktop App](https://www.google.com/intl/en_ca/drive/download/) and once installed all you do is run google drive and it will ask you to signin with your google account.

Then open the google desktop app it should either open automatically if it doesn't it will be running in the bottom right toolbar on windows. If it doesn't auto open then all you need to do is right click the app icons in the bottom right app tray.

You will see a settings cog wheel in the top right of the app window click it and click preferences then click My Computer then click add folder and select the backup folder it will then ask you to check some opitions you want to checkmark Sync with Google Drive like below.

### Sync With Google Drive

> Upload all files and folders, including photos and videos. If you edit or remove files, those changes will be automatically synced.

The only downside people may not like is the fact that google drive desktop app has to be running in the background and will use system resources so its up to you if you want to use this. Like state above this is opitonal.

The other downside is you will still need to go onto google drive via the browser and delete google drive recycle bin if your space starts to reach 15gb. I sadly couldn't automate this using AHK.
