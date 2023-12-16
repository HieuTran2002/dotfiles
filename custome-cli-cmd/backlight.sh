# first monitor is eDP-1

function backlight() 
{
    if [[ $1 -lt 10 ]]
    then
        xrandr --output eDP-1 --brightness "0.$1"
    else
        echo "No greater than 10, dumbass"
    fi
}
