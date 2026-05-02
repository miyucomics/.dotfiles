import QtQuick
import qs.services
import qs.components.generic

OSDBar {
    id: root
    value: Brightness.brightness
    color: "#f9e2af"

    Connections {
        target: Brightness
        function onBrightnessChanged() {
            root.show()
        }
    }
}