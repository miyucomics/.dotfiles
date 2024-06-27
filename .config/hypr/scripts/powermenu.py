import subprocess

result = subprocess.run(["tofi", "--prompt-text", "Power:"], input="Suspend\nExit\nShutdown\nRestart", text=True, capture_output=True)
if result.returncode == 0:
    chosen = result.stdout.strip()
    if chosen == "Suspend":
        subprocess.run(["systemctl", "suspend"])
    elif chosen == "Exit":
        subprocess.run(["hyprctl", "dispatch", "exit"])
    elif chosen == "Shutdown":
        subprocess.run(["shutdown", "now"])
    elif chosen == "Restart":
        subprocess.run(["reboot", "now"])
