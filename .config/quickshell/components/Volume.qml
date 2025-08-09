import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root
	property bool shouldShowOsd: false

	Connections {
		target: Pipewire.defaultAudioSink?.audio
		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			anchors.top: true
			margins.top: 20
			exclusiveZone: 0
			mask: Region {}

			implicitWidth: 500
			implicitHeight: 30
			color: "transparent"

			Rectangle {
				anchors.fill: parent
				radius: height / 2
				color: "#11111b"

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}

					Rectangle {
						radius: 20
						color: "#181825"
						implicitHeight: 10
						Layout.fillWidth: true

						Rectangle {
                            color: "#b4befe"
							radius: parent.radius
							implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)

							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}
						}
					}
				}
			}
		}
	}
}
