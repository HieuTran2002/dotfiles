# backlight

function backlight() 
{
    if [[ $1 -lt 10 ]]
    then
        xrandr --output eDP-1 --brightness "0.$1"
    else
        echo "No greater than 10, dumbass"
    fi
}



# bluetooth control
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

# get path
function path2clip {
    echo $(pwd) | xclip -sel clip
}


# utils with grep
function grepls()
{
    ls | grep -i "$1"
}
