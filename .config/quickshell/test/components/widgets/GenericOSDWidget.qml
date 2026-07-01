import QtQuick

Item {
    id: widget
    required property real value
    required property string color
    readonly property int preferredWidth: 500
    readonly property int preferredHeight: 12

    Rectangle {
        color: parent.color

        radius: widget.height / 2
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        implicitWidth: parent.width * parent.value

        Behavior on implicitWidth { NumberAnimation { duration: 120 } }
    }
}
