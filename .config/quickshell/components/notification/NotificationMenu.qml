import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import qs.services

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                bottom: true
                right: true
            }

            margins {
                top: 30
                right: 30
            }

            implicitWidth: 400
            mask: Region {
                item: list
            }

            exclusiveZone: 0
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Overlay

            ListView {
                id: list
                spacing: 10
                model: Notifs.list
                anchors.fill: parent
                clip: true
                delegate: NotificationItem {}
            }
        }
    }
}
