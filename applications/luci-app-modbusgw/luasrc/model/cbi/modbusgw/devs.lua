--
-- Copyright 2015 Bright Things UN Ltd. <lth@bright-things.com>
--

local ds = require "luci.dispatcher"

m = Map("modbusgw", translate("Modbus Gateway - Device definitions"), 
	translate("The following defines the ports and the Modbus \
                   devices used by the Modbus Gateway."))

ports = m:section(TypedSection, "ports", translate("Ports"))
ports.template = "cbi/tblsection"
ports.addremove = true
ports.anonymous = true
ports.sortable = false

portname = ports:option(Value, "name", translate("Name"))
portdev = ports:option(ListValue, "serialport", translate("Serial Port"))
portdev:value("/dev/ttyUSB0", "/dev/ttyUSB0")
portspeed = ports:option(ListValue, "bitrate", translate("Serial Speed"))
portspeed:value("115200", "115200")
portspeed:value("57600", "57600")
portspeed:value("38400", "38400")
portspeed:value("19200", "19200")
portspeed:value("9600", "9600")
portspeed:value("4800", "4800")
portspeed:value("2400", "2400")
portparity = ports:option(ListValue, "parity", translate("Parity"))
portparity:value("N", "None")
portparity:value("E", "Even")
portparity:value("O", "Odd")
portparity:value("M", "Mark")
portparity:value("S", "Space")
portdelay = ports:option(Value, "delay", translate("Delay"))


devices = m:section(TypedSection, "devices", translate("Devices"))
devices.template = "cbi/tblsection"
devices.addremove = true
devices.anonymous = true
devices.sortable = false

devicename = devices:option(Value, "name", translate("Name"))
devicename.size=10
devicedescription = devices:option(Value, "description", translate("Description"))
deviceaddress = devices:option(Value, "address", translate("Address"))
deviceaddress.size = 3
devicepriority = devices:option(Value, "priority", translate("Priority"))
devicepriority.size = 3
devicepriority = devices:option(Value, "device", translate("Device"))
devicedebug = devices:option(ListValue, "debug", translate("Debug"))
devicedebug:value("false", translate("False"))
devicedebug:value("true", translate("True"))

return m

