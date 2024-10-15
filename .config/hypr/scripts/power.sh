chosen=$(echo -e "Lock\nSuspend\nExit\nShutdown\nRestart" | tofi --prompt-text "Power:")

case "$chosen" in
    "Lock")
        hyprlock
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
    "Restart")
        reboot now
        ;;
    *)
        echo "Invalid option"
        ;;
esac
