pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    readonly property list<Notification> list: []

    NotificationServer {
        id: server

        keepOnReload: true
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        onNotification: notif => {
            notif.tracked = true
            root.list.push(notif)
        }
    }

    function removeNotification(index) {
        list[index].dismiss()
        list.splice(index, 1)
    }
}
