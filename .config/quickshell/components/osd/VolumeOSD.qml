import QtQuick
import qs.services

OSDBar {
    id: root
    value: Volume.volume
    color: "#f38ba8"

    Connections {
        target: Volume
        function onVolumeChanged() {
            root.show()
        }
    }
}
