pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property real brightness: 1
    property int maximum: 1

    FileView {
        watchChanges: true
        path: "/sys/class/backlight/intel_backlight/max_brightness"
        onFileChanged: reload()
        onLoaded: root.maximum = parseInt(text())
    }

    FileView {
        watchChanges: true
        path: "/sys/class/backlight/intel_backlight/actual_brightness"
        onFileChanged: reload()
        onLoaded: () => {
            root.brightness = parseInt(text()) / root.maximum
        }
    }
}
