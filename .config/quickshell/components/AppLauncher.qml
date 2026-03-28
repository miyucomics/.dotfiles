pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Wayland

PanelWindow {
    id: launcher
    focusable: true
    color: "#8011111b"
    WlrLayershell.layer: WlrLayer.Overlay

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

	function hide() {
        search.text = "";
		wrap.opacity = 0;
        launcherList.currentIndex = 0;
	}

    function fuzzyMatch(text, pattern) {
        if (!pattern)
            return {
                match: true,
                score: 0
            };

        text = text.toLowerCase();
        pattern = pattern.toLowerCase();

        let textIndex = 0;
        let patternIndex = 0;
        let score = 0;
        let consecutiveMatches = 0;

        while (textIndex < text.length && patternIndex < pattern.length) {
            if (text[textIndex] === pattern[patternIndex]) {
                patternIndex++;
                consecutiveMatches++;
                score += consecutiveMatches * 10;
            } else {
                consecutiveMatches = 0;
                score -= 1;
            }
            textIndex++;
        }

        let match = patternIndex === pattern.length;

        if (match) {
            if (text.startsWith(pattern))
                score += 100;
            let words = text.split(/\s+/);
            for (let word of words) {
                if (word.startsWith(pattern)) {
                    score += 50;
                    break;
                }
            }
        }

        return {
            match: match,
            score: score
        };
    }

    ColumnLayout {
        id: wrap
        anchors.fill: parent
		implicitHeight: parent.height - 300
        spacing: 10

		Component.onCompleted: {
			for (var item in children)
				children[item].anchors.horizontalCenter = wrap.horizontalCenter;
		}

        TextField {
            id: search
            placeholderText: "Search applications"
            implicitWidth: 500

            Layout.preferredHeight: 50

            onTextChanged: {
                launcherList.currentIndex = 0;
            }

            enabled: true
            focus: true
            activeFocusOnPress: true

            leftPadding: 15

            Keys.onPressed: event => {
                if (event.key === Qt.Key_Escape) {
                    launcher.hide();
                    event.accepted = true;
                } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    if (launcherList.count > 0) {
                        let item = launcherList.model[launcherList.currentIndex >= 0 ? launcherList.currentIndex : 0];
                        item.app.execute();
                        launcher.hide();
                    }
                    event.accepted = true;
                } else if (event.key === Qt.Key_Down) {
                    launcherList.incrementCurrentIndex();
                    event.accepted = true;
                } else if (event.key === Qt.Key_Up) {
                    launcherList.decrementCurrentIndex();
                    event.accepted = true;
                }
            }
        }

        ListView {
            id: launcherList
			implicitWidth: 500
            Layout.fillHeight: true
            focus: true

            model: {
                let applications = DesktopEntries.applications.values;
                let results = [];

                for (let app of applications) {
                    let result = launcher.fuzzyMatch(app.name, search.text);
                    if (result.match) {
                        results.push({
                            app: app,
                            score: result.score
                        });
                    }
                }

                results.sort((a, b) => {
                    if (b.score !== a.score)
                        return b.score - a.score;
                    return a.app.name.localeCompare(b.app.name);
                });

                return results;
            }

            delegate: Item {
				required property var modelData
                id: launcherEntry
                implicitWidth: parent.width
                implicitHeight: 50

                Text {
                    id: textItem
                    leftPadding: 15
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    elide: Text.ElideRight
					color: "white"
                    text: launcherEntry.modelData.app.name
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        launcherList.currentIndex = index;
                        launcherEntry.modelData.app.execute();
                        launcher.hide();
                    }
                }
            }
        }
    }
}
