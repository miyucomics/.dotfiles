import QtQuick
import qs.services
import qs.components
import "../../config.js" as Config

GenericOSDWidget {
    id: widget
    value: Volume.volume
    color: Config.colors.red

    Connections {
        target: Volume
        function onVolumeChanged() {
            IslandController.requestDisplay("widgets/VolumeWidget.qml", widget.preferredWidth, widget.preferredHeight);
        }
    }
}
