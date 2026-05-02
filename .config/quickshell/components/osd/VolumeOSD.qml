import QtQuick
import qs.services
import qs.components.generic

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