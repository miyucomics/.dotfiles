chosen=$(echo -e "Suspend\nExit\nShutdown\nRestart" | tofi --prompt-text "Power:")

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
    "Restart")
        reboot now
        ;;
esac
