import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Variants {
    model: Quickshell.screens

    PanelWindow {
        property var modelData
        screen: modelData

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        margins {
            left: 75
            top: 75
        }

        exclusiveZone: 0
        color: "transparent"
        WlrLayershell.layer: WlrLayer.Background

        ColumnLayout {
            id: content

            Text {
                text: "Activate Linux"
                font.pointSize: 22
            }

            Text {
                text: "Go to Settings to activate Linux"
                font.pointSize: 14
            }
        }
    }
}
