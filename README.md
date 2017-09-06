# Synch iPod to Google Calendar 1.0
by Pedro Parracho <pedro.parracho@gmail.com>

## Description:
This is a set of files I use to synchronize the iPod with google calendar.
 
## Install
To install you need to copy the workflow to the folder `~/Library/Services`.

## Files
* `iPod.ico` - Nice icon when the iPod is mounted  
* `AUTORUN.INF` - Autorun file, to have the icon and add the "update ICAL" option  when rights clicking over the iPod driver to launch the updateIpdoScript.sh  
* `updateIpod.sh` - script that retrieves the calendars from google (cygwin version)   
* `macUpdateIpod.sh` - script that retrieves the calendars from google (Mac Os version)  

## Note
The script, as is, expects iPod with drive letter I: and cygwin installed in `c:\cygwin\`, this can be changed in the `AUTORUN.INF` file and `updateIpod.sh`  
Edit the file `updateIpod.sh` to add your URL calendars (ICAL format)

## License
Released under MIT License