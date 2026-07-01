pragma ComponentBehavior: Bound;

import QtQuick
import QtQuick.Controls
import Quickshell
import "config.js" as Config

Item {
    id: box

    required property var entries

    property int selectedIndex: 0
    property alias query: field.text

    signal launch(var entry)
    signal quit()

    implicitWidth: 750

    function moveSelection(delta) {
        if (entries.length === 0)
            return;
        let n = selectedIndex + delta;
        if (n < 0)
            return;
        if (n > entries.length - 1)
            return;
        selectedIndex = n;
        renderedApplications.positionViewAtIndex(selectedIndex, ListView.Contain);
    }

    function activate() {
        if (entries.length > 0 && selectedIndex >= 0 && selectedIndex < entries.length)
            box.launch(entries[selectedIndex]);
    }

    Item {
        id: input
        width: parent.width
        height: field.height

        Text {
            id: indicator
            text: "❯"
            anchors.verticalCenter: parent.verticalCenter
            font: {
                "family": Config.font,
                "pixelSize": 30,
                "weight": Font.DemiBold
            }
            color: Config.colors.red
        }

        TextField {
            id: field
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent
            anchors.left: indicator.right
            anchors.leftMargin: 30
            anchors.rightMargin: 20
            background: null
            color: Config.colors.text
            font.family: Config.font
            font.pixelSize: 30
            selectByMouse: true
            focus: true
            cursorDelegate: Rectangle {
                width: 15
                color: Config.colors.red
            }
            Keys.onUpPressed: box.moveSelection(-1)
            Keys.onDownPressed: box.moveSelection(1)
            Keys.onPressed: (press) => {
                if (press.key === Qt.Key_Return || press.key === Qt.Key_Enter) {
                    box.activate();
                    press.accepted = true;
                } else if (press.key === Qt.Key_Escape) {
                    box.quit();
                    press.accepted = true;
                }
            }
        }
    }

    ListView {
        id: renderedApplications
        width: parent.width
        anchors.top: input.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        topMargin: 40
        spacing: 40
        leftMargin: 12
        implicitHeight: Math.min(contentHeight + topMargin, 9 * 70 + topMargin)
        model: box.entries.length

        boundsBehavior: Flickable.StopAtBounds
        clip: true

        delegate: AppRow {
            required property int index
            entry: box.entries[index]
            width: box.width
            selected: index === box.selectedIndex
        }
    }
}
