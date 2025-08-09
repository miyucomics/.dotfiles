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
            right: true
            bottom: true
        }

        margins {
            right: 75
            bottom: 75
        }

        implicitWidth: content.width
        implicitHeight: content.height

        color: "transparent"
        mask: Region {}
        WlrLayershell.layer: WlrLayer.Overlay

        ColumnLayout {
            id: content

            Text {
                text: "Activate Linux"
                color: "#99ffffff"
                font.pointSize: 22
            }

            Text {
                text: "Go to Settings to activate Linux"
                color: "#99ffffff"
                font.pointSize: 14
            }
        }
    }
}
