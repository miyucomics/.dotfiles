import Notification from "../notifications/Notification.js"

const notifications = await Service.import("notifications")
const notifs = notifications.bind("notifications")

const Animated = n =>
    Widget.Revealer({
        transition_duration: 1000,
        transition: "slide_down",
        child: Notification(n),
        setup: self =>
            Utils.timeout(1000, () => {
                if (!self.is_destroyed) self.reveal_child = true
            })
    })

const ClearButton = () =>
    Widget.Button({
        on_clicked: notifications.clear,
        sensitive: notifs.as(n => n.length > 0),
        visible: notifs.as(n => n.length > 0),
        child: Widget.Label("Clear")
    })

const NotificationList = () => {
    const map = new Map()
    const box = Widget.Box({
        vertical: true,
        children: notifications.notifications.map(n => {
            const w = Animated(n)
            map.set(n.id, w)
            return w
        }),
        visible: notifs.as(n => n.length > 0)
    })

    function remove(_, id) {
        const n = map.get(id)
        if (n) {
            n.reveal_child = false
            Utils.timeout(1000, () => {
                n.destroy()
                map.delete(id)
            })
        }
    }

    return box.hook(notifications, remove, "closed").hook(
        notifications,
        (_, id) => {
            if (id !== undefined) {
                if (map.has(id)) remove(null, id)
                const n = notifications.getNotification(id)
                const w = Animated(n)
                map.set(id, w)
                box.children = [w, ...box.children]
            }
        },
        "notified"
    )
}

const Placeholder = () =>
    Widget.Box({
        class_name: "placeholder",
        vertical: true,
        vpack: "center",
        hpack: "center",
        vexpand: true,
        hexpand: true,
        visible: notifs.as(n => n.length === 0),
        children: [Widget.Label("Your inbox is empty")]
    })

export default () =>
    Widget.Box({
        class_name: "notification-column",
        css: `min-width: ${300}px; padding: 10px;`,
        vertical: true,
        children: [
            Widget.Scrollable({
                vexpand: true,
                hscroll: "never",
                class_name: "notification-scrollable",
                child: Widget.Box({
                    class_name: "notification-list vertical",
                    vertical: true,
                    children: [NotificationList(), Placeholder()]
                })
            })
        ]
    })
