$Title = "Unwanted virtual hardware found"
$Header = "Unwanted virtual hardware found: [count]"
$Comments = "Certain kinds of hardware are unwanted on virtual machines as they may cause unnecessary vMotion constraints."
$Display = "Table"
$Author = "Frederic Martin"
$PluginVersion = 1.2
$PluginCategory = "vSphere"

# Start of Settings
# Find unwanted virtual hardware
$unwantedHardware = "VirtualUSBController|VirtualParallelPort|VirtualSerialPort"
# End of Settings
