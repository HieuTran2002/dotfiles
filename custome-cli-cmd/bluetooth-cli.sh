# UUID of headset 
HEADSET=41:42:FF:0F:82:40

function blue-reset {
    timeout 5 bluetoothctl remove $HEADSET
    timeout 5 bluetoothctl scan on
    bluetoothctl trust $HEADSET
    bluetoothctl pair $HEADSET
    
}

function blue-connect 
{
    bluetoothctl connect $HEADSET

    # if no connection, wait
    pactl list short sinks | grep -i "bluez" | awk '{print $1}'
    echo "Volume adjusting"
    sleep 1
    pactl -- set-sink-volume $(pactl list short sinks | grep -i "bluez" | awk '{print $1}') 20%
    echo "Done"
}

function blue-disconnect 
{
    bluetoothctl disconnect
}
