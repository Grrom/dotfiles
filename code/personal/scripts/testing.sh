	port="usb3" # as shown by lsusb -t: {bus}-{port}(.{subport})
	echo "$port"
	echo "$port" >/sys/bus/usb/drivers/usb/unbind
	sleep 1
	echo "$port" >/sys/bus/usb/drivers/usb/bind
