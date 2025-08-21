import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell.Widgets
import qs.services

SwipeDelegate {
    id: notification

    required property string image
    required property string appIcon
    required property int index
    required property NotificationUrgency urgency
    required property string summary
    required property string body
    required property list<NotificationAction> actions

    padding: 10
    implicitWidth: 400

    background: Rectangle {
        color: "#181825"
        radius: 5
    }

    contentItem: ColumnLayout {
        spacing: 10

        Text {
            text: summary
            font.family: "IosevkaTerm Nerd Font Propo"
            font.pointSize: 15
            color: {
                if (urgency == NotificationUrgency.Critical)
                    return "#f38ba8"
                else if (urgency == NotificationUrgency.Low)
                    return "#a6adc8"
                else
                    return "#cdd6f4"
            }
        }

        Text {
            text: body
            font.family: "IosevkaTerm Nerd Font Propo"
            font.pointSize: 12
            color: "#bac2de"
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 5

            Repeater {
                model: notification.actions

                Button {
                    id: button
                    required property NotificationAction modelData
                    text: modelData.text

                    background: Rectangle {
                        color: "#1e1e2e"
                        radius: 5
                    }

                    contentItem: Text {
                        text: button.text
                        font.family: "IosevkaTerm Nerd Font Propo"
                        font.pointSize: 12
                        color: "#cdd6f4"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        padding: 5
                    }

                    onClicked: {
                        modelData.invoke()
                        Notifs.removeNotification(notification.index)
                    }

                    Layout.fillWidth: true
                }
            }
        }
    }

    swipe.right: Label {
        text: "Clear"
        color: "#181825"
        font.family: "IosevkaTerm Nerd Font Propo"
        font.pointSize: 16
        font.weight: 500
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        padding: 20
        background: Rectangle {
            color: "#f38ba8"
            radius: 5
        }
    }

    swipe.onCompleted: {
        Notifs.removeNotification(index)
    }
}
