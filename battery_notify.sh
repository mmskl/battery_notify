#!/bin/bash

# ------------------------------------------------------------------
#  notify_nbattery.sh
#          Script sent notification at below specified battery percentage
#          First argument specifies urgency of the message, at the moment supported are  "critical" and "normal"
#          Second sets after below what battery status notification is supposed to show up
#          Third is time notify shows
#          
# Dependency:
#     notify-send awk
# ------------------------------------------------------------------
VERSION=0.1.0
USAGE="Usage: battery_notify -hv arg arg"


#echo Battery 0: Charging, 48%, 05:44:28 until charged

# ---------help and examples--------------------------------------------------------
help_and_examples() {

    if [ "$#" -ne 2 ]; then
        echo ""
        echo Script sent notification at below specified battery percentage
        echo First argument specifies urgency of the message, at the moment supported are  "critical" and "normal"
        echo Second sets after below what battery status notification is supposed to show up
        echo Third is time notify shows

        echo Good idead\'d be to put it somewhere in crontab in about 5-10m

        echo Usage:
        echo     battery_notify normal 20
        echo     battery_notify critical 2 10
        echo
        exit
    fi

}


if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi



if [[ "$1" == '-h' ||  "$1" == '--help' ]]; then
    help_and_examples
fi


acpi_atatus="$(acpi -b)"


Battery 0: Charging, 98%, 00:08:21 until charged
# ------- checking if charging ------------------------------------

if [[ "$acpi_atatus" == *"Discharging"* ]]; then
    discharging=true
else
    discharging=false
fi





    awk  '{ match(, 
     +(([0-9]\:[0-9]\:[0-9]\:)/, \
     +([ until charged|,Full,remaining ]) \
      arr) print battery_percentage, average_time }'



echo "$x" | awk '$0 ~ /[0-9]{2}:[0-9]{2}:[0-9]{2}/'


echo "$x" | awk '$0 ~ /\([0-9]{2}\){4}/'

echo 'Battery 0: Discharging, 81%, 17:26:16 remaining'| awk '$0 ~ /[0-9]{2}:[0-9]{2}:[0-9]{2}/'

x=" $'\n'
Battery 0: Discharging, 81%, 07r26:16 remaining$'\n'
Battery 0: Discharging, 81%, 07:26:16 remaining"



# ([a-zA-Z])

# Battery..\ [z-Z-Z](

echo 'Battery 0: Discharging, 81%, 07:26:16 remaining"' |
print 12345567iuy6543jjkawk | ack 'match\($0, "/(0-9]{2}:[0-9]{2}:[0-9]{2}/\)/", "matches" [\) END \( print matches[ \)'


# echo
# battery_percentage="$(echo " | awk 'match($0, "%s" { print substr( $0, RSTART, RLENGTH )}' '/[0-9]+%/')"

echo abc_def | awk '/../{ print $0 }'  

#estimated_time="'$( get_metrics \"\"$acpi_atatus\"\" '/[0-9]+:[0-9]+:[0-9]+/' )'"

echo '777777777777777777'
echo "$battery_percentage"
# echo "$estimated_time"
echo '8888888888888'


ARGS=""

if [ $discharging ]; then
    loking_string=' until charged'
else
    loking_string=' remaining'
fi
echo '$loking_string'
echo "$loking_string"

sed_string="$(printf 's/\(.*\)/%s/\1/' \"$loking_string\")"

echo $acpi_atatus | sed 's/.*\s\([0-0]\)/\1/' | sed -e "$sed_string"



ARGS="${ARGS} --hint=string:abc:39"
# ARGS="${ARGS} --hint=string:\"abc\":${estimated_time}"

# DEFAULTS
level="normal"
notify_time=6
below_battery_level=15

if [ -z "$1" ]; then
    level=$1
fi

if [ -z "$2" ]; then
    notify_time=$2
fi

if [ -z "$3" ]; then
    below_battery_level=$3
fi



ARGS="${ARGS} --urgency=${level}"
ARGS="${ARGS} --expire-time=${notify_time}"


echo -----------
echo $battery_percentage 
echo $below_battery_level
echo -----------

if [ $battery_percentage -le $below_battery_level ]; then
    notify-send ${ARGS} BATTERY 
fi





