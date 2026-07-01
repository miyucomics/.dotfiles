pragma ComponentBehavior: Bound;

import QtQuick
import Quickshell
import "config.js" as Config

Item {
    id: row

    required property var entry
    required property bool selected

    implicitHeight: 30

    Item {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15

        Rectangle {
            id: placeholderIcon
            anchors.verticalCenter: parent.verticalCenter
            width: 30
            height: 30
            radius: 6
            color: Config.colors.crust
            visible: !icon.visible
        }

        Image {
            id: icon
            anchors.fill: placeholderIcon
            sourceSize.width: 60
            sourceSize.height: 60
            asynchronous: true
            visible: status === Image.Ready && source !== ""
            source: row.entry.icon ? Quickshell.iconPath(row.entry.icon, true) : ""
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: icon.right
            anchors.leftMargin: 12
            text: row.entry.name
            color: row.selected ? Config.colors.text : Config.colors.subtext1
            font: {
                "family": Config.font,
                "pixelSize": 30,
                "weight": row.selected ? Font.DemiBold : Font.Normal,
            }
            width: Math.min(implicitWidth, parent.width - icon.width - 12 - 18)
        }
    }
}
