pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root
    property real volume: 0

	Connections {
		target: Pipewire.defaultAudioSink?.audio
        function onVolumeChanged() {
            root.volume = Pipewire.defaultAudioSink?.audio.volume
        }
	}

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}
}
