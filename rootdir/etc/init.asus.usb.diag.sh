usb_diag=`getprop sys.usb.diag`
usb_diag_logtool=`getprop persist.usb.diag`
ssn_value=`getprop ro.serialno`
diag_enable = `cat /sys/class/android_usb/android0/diag`
usb_config=`getprop sys.usb.config`
usb_config_temp=`getprop sys.usb.config.temp`
cmdline=`cat /proc/cmdline`
boot_complet=`getprop sys.boot_completed`


#Check Fuse status


if [ $usb_diag_logtool == "1" ]  ;then
if [ $usb_config != "diag,adb" ] ;then
	setprop sys.usb.config.temp $usb_config
	setprop sys.usb.config diag,adb
fi

elif [ $usb_diag_logtool == "0" ] ;then
	if [ $usb_config_temp != "" ]  && [ $boot_complet == "1" ];then
	setprop sys.usb.config $usb_config_temp
	fi
fi
