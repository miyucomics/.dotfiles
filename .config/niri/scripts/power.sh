chosen=$(echo -e "Suspend\nExit\nShutdown" | tofi --prompt-text "Power:")

case "$chosen" in
    "Suspend")
        systemctl suspend
        ;;
    "Exit")
        niri msg action quit
        ;;
    "Shutdown")
        shutdown now
        ;;
esac
