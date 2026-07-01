import QtQuick
import "../../config.js" as Config

Item {
    id: widget
    readonly property int preferredWidth: 150
    readonly property int preferredHeight: 50

    Text {
        text: "Test"
        color: Config.colors.text
        anchors.centerIn: parent
        font.family: Config.font
        font.pixelSize: 18
    }
}
