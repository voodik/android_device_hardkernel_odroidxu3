#!/system/bin/sh

GPSTTY=$(getprop ro.kernel.android.gps)
SPEED=$(getprop ro.kernel.android.gps.speed)

if [ "$GPSTTY" == "" ];
then
SPEED="4800"
fi;

if [ "$GPSTTY" != "" ];
then

	if [ -c /dev/$GPSTTY ];
	then
		echo "Setting USB GPS $GPSTTY speed to $SPEED"
		/system/xbin/stty -F /dev/$GPSTTY ispeed $SPEED
		chown root:system /dev/$GPSTTY
		chmod 666 /dev/$GPSTTY
	fi;
fi;
