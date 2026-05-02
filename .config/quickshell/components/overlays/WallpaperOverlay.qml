import QtQuick
import QtQuick.Controls
import Qt.labs.folderlistmodel
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import qs.components.generic

Scope {
	id: root
	required property string name
	required property bool isActive

	IpcHandler {
		target: "wallpaper-selector"
		function activate() {
			root.isActive = true;
		}
	}

	Overlay {
		id: overlay
		isActive: root.isActive

		LazyLoader {
			active: overlay.opacity != 0

			PathView {
				id: carousel
				anchors.fill: parent
				model: imagesModel
				pathItemCount: 7
				preferredHighlightBegin: 0.5
				preferredHighlightEnd: 0.5
				opacity: overlay.opacity
				focus: true

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

						scale: delegateItem.PathView.isCurrentItem ? 1.0 : 0.9
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
				Keys.onEscapePressed: root.isActive = false
				Keys.onReturnPressed: {
					setWallpaper(carousel.currentItem.filePath);
					root.isActive = false;
				}
				Keys.onSpacePressed: {
					setWallpaper(carousel.currentItem.filePath);
					root.isActive = false;
				}
				Keys.onPressed: (event) => {
					switch (event.key) {
						case Qt.Key_H: case Qt.Key_K: carousel.decrementCurrentIndex(); break;
						case Qt.Key_L: case Qt.Key_J: carousel.incrementCurrentIndex(); break;
					}
					event.accepted = true;
				}
			}
		}
	}

	function setWallpaper(path) {
		wallpaperProcess.command = ["awww", "img", "-tcenter", path];
		wallpaperProcess.running = true;
		root.isActive = false;
	}

	Process {
		id: wallpaperProcess
	}

	Component.onCompleted: {
		scanner.scanDirectory("file:///home/miyu/.config/wallpapers/");
	}

	ListModel {
		id: imagesModel
	}

	Item {
		id: scanner
		property var queue: []

		FolderListModel {
			id: worker
			showDirs: true
			showFiles: true
			showDotAndDotDot: false

			onStatusChanged: {
				if (status === FolderListModel.Ready)
					scanner.processCurrentFolder();
			}
		}

		function scanDirectory(path) {
			queue.push(path);
			tick();
		}

		function processCurrentFolder() {
			for (let i = 0; i < worker.count; i++) {
				if (worker.isFolder(i)) {
					queue.push("file://" + worker.get(i, "filePath"));
					continue;
				}

				imagesModel.append({
					"fileUrl": "file://" + worker.get(i, "filePath"),
					"filePath": worker.get(i, "filePath")
				});
			}

			tick();
		}

		function tick() {
			if (queue.length > 0)
				worker.folder = queue.shift();
		}
	}
}