chosen=$(echo -e "Kill slurp\nSuspend\nExit\nShutdown" | tofi --prompt-text "Power:")

case "$chosen" in
    "Kill slurp")
        pkill slurp
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Exit")
        hyprctl dispatch exit
        ;;
    "Shutdown")
        shutdown now
        ;;
esac
