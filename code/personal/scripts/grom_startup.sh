
# it's a workound for my faulty bluetooth adapter
btusb_workaround(){
	rmmod btusb;
	modprobe btusb;
	sleep 1
	port="usb1-7" # as shown by lsusb -t: {bus}-{port}(.{subport})
	echo "$port"
	echo "$port" >/sys/bus/usb/drivers/usb/unbind
	sleep 1
	echo "$port" >/sys/bus/usb/drivers/usb/bind
}

btusb_workaround

