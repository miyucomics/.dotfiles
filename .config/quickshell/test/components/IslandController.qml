pragma Singleton

import QtQuick

QtObject {
    id: controller

    property string activeWidgetSource: "widgets/IdleWidget.qml"
    property int targetWidth: 150
    property int targetHeight: 30

    property Timer timeoutTimer: Timer {
        interval: 1000
        onTriggered: controller.requestDisplay("widgets/IdleWidget.qml", 150, 30)
    }

    function requestDisplay(sourceFile, width, height) {
        activeWidgetSource = sourceFile;
        targetWidth = width;
        targetHeight = height;
        timeoutTimer.restart();
    }
}
