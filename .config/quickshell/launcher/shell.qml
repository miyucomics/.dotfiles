import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "lib/fuzzy.js" as Fuzzy

ShellRoot {
    id: root

    property bool shown: false
    property string query: ""
    property var weights: ({})

    readonly property var rejectionRules: [/^Avahi/, /^Foot/, /^Hardware/, /^Qt/, /^OpenJDK/]
    readonly property var desktopEntries: {
        return DesktopEntries.applications.values.filter(entry => {
            if (entry.noDisplay)
                return false;
            const matchesRule = root.rejectionRules.some(rule => rule.test(entry.name));
            return !matchesRule;
        })
    }
    readonly property var results: Fuzzy.rank(desktopEntries, query, weights)

    function run(entry) {
        if (entry) {
            if (entry.id) {
                root.weights[entry.id] = (root.weights[entry.id] || 0) + 1;
                weightsCacheFile.setText(JSON.stringify(root.weights));
                weightsCacheFile.waitForJob();
            }
            entry.execute();
        }
        root.shown = false;
    }

    PanelWindow {
        visible: root.shown
        color: "#dd11111b"
        anchors { top: true; left: true; right: true; bottom: true }
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "launcher"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        Launcher {
            id: launcher
            anchors.centerIn: parent
            entries: root.results
            onLaunch: (entry) => root.run(entry)
            onQuit: root.shown = false
        }

        Connections {
            target: launcher
            function onQueryChanged() {
                root.query = launcher.query;
                launcher.selectedIndex = 0;
            }
        }

        onVisibleChanged: {
            launcher.query = "";
            launcher.selectedIndex = 0;
        }
    }

    FileView {
        id: weightsCacheFile
        path: Quickshell.env("XDG_STATE_HOME") + "/miyu/launcher-weights.json"
        blockLoading: true
        atomicWrites: true
        printErrors: false
    }

    Component.onCompleted: {
        let raw = weightsCacheFile.text();
        try {
            root.weights = raw && raw.length ? JSON.parse(raw) : ({});
        } catch (e) {
            root.weights = ({});
        }
    }

    IpcHandler {
        target: "launcher"
        function reveal(): void { root.shown = true; }
    }
}
