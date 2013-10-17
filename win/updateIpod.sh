#
#iPod calendar updater
#by berserck (berserck@gmail.com) 
# command line to start this script
#\cygwin\bin\bash -lc ". updateIpod.sh"

#
# define the calendars
#name for filename of the calendar. Choose a name filename friendly, please
declare -a calendars=('NameDay' 'PortugueseHolidays')
# define the calendars URL
declare -a calURL=(
#add HERE the URL of your calendars, corresponding to the names above
http://www.google.com/calendar/ical/9ereilc2p5qgisk5p50814fotg%40group.calendar.google.com/public/basic.ics
http://www.google.com/calendar/ical/1rsmiv2jqek9cmn4c8f3ovub6c%40group.calendar.google.com/public/basic.ics
)
# define ipod Directory
Destination="/cygdrive/i/Calendars/"
# if drive name changes, also change the autorun script
################################################################################
#       Done With User Variables                                               #
################################################################################
############################# FUNCTIONS ########################################
fileExist_Forced()
{
  if [ -e $1 ]; 
  then 
     echo "deleting file: $1"
     rm  $1
  fi
}

fileExists_Check()
{
   if [ -e $1 ]
   then
      echo $n The file exists, shall I overwrite? $c;  read ans
      case "$ans" in
         n*|N*)
            echo -e "\033[1;31m ABORTED!!!\033[0m";
            exit 0   ;;
         y*|Y*)
            echo "deleting file: $1";
            rm $1;;
      esac
fi
}
############################### Main Function #################################
#calculate the Number of calendars
NumCal=0
while [ "x${calendars[NumCal]}" != "x" ]
do
   NumCal=$(( $NumCal + 1 ))
done
# Calculate the last Index
LastIndex=$(( $NumCal - 1 ))

# clean-up before starting
   # clean old calendars
  for i in  $( seq 0 $LastIndex ) ;
  do
   filename=$TEMP/${calendars[$i]}.ics
   # TODO: Chose a defined option and check that it is the one passed
   if [ $# -ne 1 ] #Going Safe
   then
      fileExists_Check $filename
   else
      fileExist_Forced $filename
   fi
done
# cycle trought the list of calendars
for i in  $(seq 0 $LastIndex ) ;
do
   echo $i: Getting Calendar ${calendars[$i]};
   # wget the calendars
   wget -q -O $TEMP/${calendars[$i]}.ics ${calURL[$i]}
   # check that the file was correclty downloaded
   if [ $? -ne 0 ] 
   then
      echo -e "\033[1;31m ERROR:\033[0m Retriving the calendar ${calendars[$i]}"
      echo "URL: ${calURL[$i]}"
   else
      #move files to Ipod
      mv $TEMP/${calendars[$i]}.ics $Destination
   fi
done 

sleep 10

