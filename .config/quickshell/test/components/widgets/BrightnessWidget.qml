import QtQuick
import qs.services
import qs.components
import "../../config.js" as Config

GenericOSDWidget {
    id: widget
    value: Brightness.brightness
    color: Config.colors.yellow

    Connections {
        target: Brightness
        function onBrightnessChanged() {
            IslandController.requestDisplay("widgets/BrightnessWidget.qml", widget.preferredWidth, widget.preferredHeight);
        }
    }
}
