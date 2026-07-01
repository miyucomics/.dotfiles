pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import qs.components.widgets
import "../config.js" as Config

PanelWindow {
    id: islandWindow

    anchors.top: true
    exclusiveZone: 0
    implicitWidth: 800
    implicitHeight: 100
    color: "transparent"

    mask: Region { item: pillBackground } 

    Rectangle {
        id: pillBackground
        color: Config.colors.base
        radius: height / 2
        clip: true

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10

        implicitWidth: IslandController.targetWidth
        implicitHeight: IslandController.targetHeight

        Behavior on implicitWidth { NumberAnimation { duration: 250; easing.type: Easing.OutQuint } }
        Behavior on implicitHeight { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }

        Loader {
            id: widgetLoader
            anchors.fill: parent
            source: IslandController.activeWidgetSource
            opacity: status === Loader.Ready ? 1 : 0
            Behavior on opacity { NumberAnimation { duration: 150 } }
        }
    }

    BrightnessWidget { visible: false }
    VolumeWidget { visible: false }
}
