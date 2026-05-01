chosen=$(echo -e "Monitor Off\nKill Quickshells\nSuspend\nExit\nShutdown" | tofi --prompt-text "Power:")

case "$chosen" in
    "Monitor Off")
        niri msg action power-off-monitors
        ;;
    "Kill Quickshells")
        killall -9 qs
        ;;
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
