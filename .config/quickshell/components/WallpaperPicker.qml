import QtQuick
import QtQuick.Controls
import Qt.labs.folderlistmodel
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
	property bool isActive: false

	WlrLayershell.keyboardFocus: isActive ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
	color: Qt.hsva(0.66, 0.23, 0.09, carousel.opacity * 0.86)
	visible: carousel.opacity > 0

	anchors {
		top: true
		bottom: true
		left: true
		right: true
	}

	PathView {
		id: carousel
		anchors.fill: parent
		model: imagesModel
		pathItemCount: 7
		preferredHighlightBegin: 0.5
		preferredHighlightEnd: 0.5
		focus: true

		opacity: isActive ? 1 : 0
		Behavior on opacity { NumberAnimation { duration: 250; easing.type: Easing.OutCubic } }

		path: Path {
			startX: -300
			startY: carousel.height / 2
			PathLine { 
				x: carousel.width + 300
				y: carousel.height / 2 
			}
		}

		delegate: Item {
			id: delegateItem
			property string filePath: model.filePath
			width: 500
			height: 700

			Image {
				anchors.fill: parent
				source: fileUrl
				fillMode: Image.PreserveAspectCrop

				asynchronous: true
				sourceSize.height: 900

				scale: delegateItem.PathView.isCurrentItem ? 1.0 : 0.75
				Behavior on scale { NumberAnimation { duration: 200 } }

				MouseArea {
					anchors.fill: parent
					onClicked: {
						setWallpaper(filePath);
					}
				}
			}
		}

		MouseArea {
			anchors.fill: parent
			onWheel: wheel => {
				if (wheel.angleDelta.y > 0)
					carousel.decrementCurrentIndex();
				else
					carousel.incrementCurrentIndex();
			}
		}

		Keys.onLeftPressed: carousel.decrementCurrentIndex()
		Keys.onRightPressed: carousel.incrementCurrentIndex()
		Keys.onEscapePressed: isActive = false
		Keys.onReturnPressed: {
			setWallpaper(carousel.currentItem.filePath);
			isActive = false;
		}
		Keys.onSpacePressed: {
			setWallpaper(carousel.currentItem.filePath);
			isActive = false;
		}
		Keys.onPressed: (event) => {
			if (event.key == Qt.Key.Key_J)
				carousel.incrementCurrentIndex()
			if (event.key == Qt.Key.Key_K)
				carousel.decrementCurrentIndex()
		}
	}

	function setWallpaper(path) {
		wallpaperProcess.command = ["awww", "img", "-tcenter", path];
		wallpaperProcess.running = true;
		isActive = false;
	}

	Process {
		id: wallpaperProcess
	}

	FolderListModel {
		id: imagesModel
		folder: "file:///home/miyu/.dotfiles/.config/wallpapers/abstract"
		nameFilters: ["*.jpg", "*.png", "*.webp"]
	}

	IpcHandler {
	    target: "wallpaper-selector"
		function activate() {
			isActive = true;
		}
	}
}