import QtQuick
import QtQuick.Controls
import Qt.labs.folderlistmodel
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
	required property bool isActive
	property double opacity: isActive ? 1 : 0
	Behavior on opacity { NumberAnimation { duration: 250; easing.type: Easing.OutCubic } }

	WlrLayershell.keyboardFocus: isActive ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
	color: Qt.hsva(0.66, 0.23, 0.09, opacity * 0.86)
	visible: opacity > 0

	anchors {
		top: true
		bottom: true
		left: true
		right: true
	}
}