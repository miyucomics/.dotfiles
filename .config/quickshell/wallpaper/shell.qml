pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import Qt.labs.folderlistmodel

PanelWindow {
    id: main

    property int speed: 5000
    property int animationDuration: 100
    property real zoomScale: 0.8
    property real edgeScale: 0.3
    property real skewFactor: 0

    implicitHeight: 500
    implicitWidth: Screen.width
    color: "transparent"

    aboveWindows: true
    exclusionMode: ExclusionMode.Ignore
    exclusiveZone: 1

    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    FileView {
        path: Quickshell.shellPath("config.json")
        JsonAdapter {
            id: configs
            property string wallpaper_path
            property int number_of_pictures
        }
    }

    FolderListModel {
        id: folderModel
        folder: "file://" + configs.wallpaper_path
    }

    ListView {
        id: list
        focus: true
        anchors.fill: parent

        model: folderModel
        orientation: ListView.Horizontal
        spacing: 8
        clip: true

        property int selectedIndex: 0
        property real tileWidth: width / configs.number_of_pictures - 10
        property real viewportCenterX: width / 2

        function clampIndex(i) {
            return Math.max(0, Math.min(i, count - 1));
        }

        function clampX(x) {
            return Math.max(0, Math.min(x, contentWidth - width));
        }

        function activateCurrent() {
            const path = folderModel.get(selectedIndex, "filePath");
            Quickshell.execDetached(["awww img -twipe", path]);
            Qt.quit();
        }

        function ensureVisibleAnimated(i) {
            const step = tileWidth + spacing;
            const itemStart = i * step;
            const itemEnd = itemStart + tileWidth + 20;

            if (itemStart < contentX)
                contentX = clampX(itemStart);
            else if (itemEnd > contentX + width)
                contentX = clampX(itemStart - (width - step));
        }

        function moveSelection(delta, speedMultiplier) {
            anim.v = main.speed * speedMultiplier;
            selectedIndex = clampIndex(selectedIndex + delta);
            ensureVisibleAnimated(selectedIndex);
        }

        Behavior on contentX {
            SmoothedAnimation {
                id: anim
                property int v: main.speed
                duration: main.animationDuration
            }
        }

        delegate: Item {
            id: delegateItem

            required property int index
            property string path: folderModel.get(index, "filePath")
            property bool active: index === list.selectedIndex

            height: 500

            // Base (unscaled) slot width. Used to work out where this tile currently sits
            // on screen for the magnification curve below. Deliberately NOT derived from
            // this item's own (dynamic) width - if it were, width would depend on position
            // which would depend on width, i.e. a binding loop.
            readonly property real baseWidth: list.tileWidth

            // --- Dock-style magnification: scale depends on on-screen position ---
            // One binding instead of several chained ones - list.contentX already animates
            // smoothly (SmoothedAnimation below), so this recomputes every frame during
            // scroll anyway; no need for extra Behavior/NumberAnimation layered on top of
            // it (that was two animations fighting over the same value, which is what was
            // causing the sluggish feel).
            property real scaleFactor: {
                const centerX = x - list.contentX + baseWidth / 2;
                const frac = Math.min(1, Math.abs(centerX - list.viewportCenterX) / list.viewportCenterX);
                const t = 1 - frac * frac * (3 - 2 * frac); // smoothstep falloff
                return main.edgeScale + (main.zoomScale - main.edgeScale) * t;
            }

            // This IS the delegate's real layout width, so as it grows, ListView pushes
            // every following tile further along - real spacing, not an overlapping overlay.
            // No Behavior here: it already tracks contentX's smooth animation 1:1, and tiles
            // never overlap in this layout, so there's nothing to visually smooth over.
            width: baseWidth * scaleFactor

            Item {
                id: content
                anchors.centerIn: parent
                width: parent.width
                // Height scale uses the same factor but caps at 1.0 - the row is already
                // full window height, so growing past that would just get clipped.
                height: delegateItem.height * Math.min(1, delegateItem.scaleFactor)

                Image {
                    id: img
                    anchors.fill: parent
                    opacity: 0.8
                    fillMode: Image.PreserveAspectCrop

                    asynchronous: true
                    cache: false
                    smooth: true
                    source: "file://" + delegateItem.path

                    sourceSize.width: delegateItem.baseWidth * main.zoomScale
                    sourceSize.height: delegateItem.height

                    transform: Shear {
                        xFactor: main.skewFactor
                    }
                }

                Rectangle {
                    id: border
                    z: 10
                    anchors.fill: parent
                    visible: delegateItem.active
                    color: "transparent"
                    border.width: 2
                    border.color: "red"
                    transform: Shear {
                        xFactor: main.skewFactor
                    }
                }
            }
        }

        Keys.onPressed: function (event) {
            switch (event.key) {
            case Qt.Key_J:
                moveSelection(1, 1);
                break;
            case Qt.Key_K:
                moveSelection(-1, 1);
                break;
            case Qt.Key_Space:
            case Qt.Key_Return:
                activateCurrent();
                break;
            case Qt.Key_Escape:
                Qt.quit();
                break;
            default:
                return;
            }

            event.accepted = true;
        }
    }
}
