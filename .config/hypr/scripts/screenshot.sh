hyprpicker -r -z &
sleep 0.2
PID=$!

region=$(slurp -b11111bdd -c00000000)

if [ -z "$region" ]; then
    kill $PID
    exit 1
fi

grim -g "$region" - | wl-copy -t image/png
kill $PID
