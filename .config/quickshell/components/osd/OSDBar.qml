pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Scope {
    id: root
    required property real value
    property string color: "#89b4fa"

    property int height: 10
    property real marginTop: -height

    LazyLoader {
        active: root.marginTop != -root.height

        PanelWindow {
            anchors.top: true
            exclusiveZone: 0
            mask: Region {}

            implicitWidth: 500
            implicitHeight: root.height
            margins.top: root.marginTop
            color: "transparent"

            Rectangle {
                color: "#11111b"
                anchors.fill: parent
                radius: parent.height / 2
            }

            Rectangle {
                color: root.color
                radius: parent.height / 2
                implicitWidth: parent.width * root.value

                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
            }
        }
    }

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: () => {
            root.marginTop = -root.height;
        }
    }

    function show() {
        root.marginTop = 20;
        hideTimer.restart();
    }

    Behavior on marginTop {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutSine
        }
    }

    Behavior on value {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutSine
        }
    }
}
