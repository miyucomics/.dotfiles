pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root
    property real volume: 0
    property real animatedVolume: 1

	Connections {
		target: Pipewire.defaultAudioSink?.audio
        function onVolumeChanged() {
            root.volume = Pipewire.defaultAudioSink?.audio.volume
            root.animatedVolume = Pipewire.defaultAudioSink?.audio.volume
        }
	}

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

    Behavior on animatedVolume {
        NumberAnimation {
            duration: 100
            easing.type: Easing.OutSine
        }
    }
}
