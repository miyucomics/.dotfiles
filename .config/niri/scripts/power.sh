chosen=$(echo -e "Suspend\nExit\nShutdown" | tofi --prompt-text "Power:")

case "$chosen" in
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
