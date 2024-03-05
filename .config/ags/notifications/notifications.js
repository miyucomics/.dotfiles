const notifications = await Service.import("notifications")

const NotificationIcon = ({ app_entry, app_icon, image }) => {
    if (image)
        return Widget.Box({
            className: "icon",
            css: `
            background-image: url("${image}");
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            `
        })
    let icon = "dialog-information-symbolic"
    if (Utils.lookUpIcon(app_icon)) icon = app_icon
    if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry
    return Widget.Icon({
        icon: icon,
        className: "icon"
    })
}

const Popup = notification => {
    const icon = NotificationIcon(notification)

    const title = Widget.Label({
        class_name: "title",
        xalign: 0,
        justification: "left",
        hexpand: true,
        max_width_chars: 24,
        truncate: "end",
        wrap: true,
        label: notification.summary,
        use_markup: true
    })

    const body = Widget.Label({
        class_name: "body",
        hexpand: true,
        use_markup: true,
        xalign: 0,
        justification: "left",
        label: notification.body,
        wrap: true
    })

    const actions =
        notification.actions.length > 0
            ? Widget.Revealer({
                transition: "slide_down",
                child: Widget.Box({
                    children: notification.actions.map(action =>
                        Widget.Button({
                            class_name: "action-button",
                            on_clicked: () => notification.invoke(action.id),
                            child: Widget.Label(action.label),
                            hexpand: true
                        })
                    )
                })
            })
            : null

    return Widget.EventBox({
        on_primary_click: () => notification.dismiss(),
        on_hover: () => {
            if (actions) actions.reveal_child = true
        },
        child: Widget.Box({
            class_name: `notification ${notification.urgency}`,
            vertical: true,
            children: [
                Widget.Box({
                    children: [icon, Widget.Box({ vertical: true, children: [title, body] })]
                }),
                actions
            ]
        })
    })
}

const popups = notifications.bind("popups")
export default Widget.Window({
    name: "notifications",
    className: "notification-window",
    anchor: ["top", "left"],
    child: Widget.Box({
        vertical: true,
        className: "notifications",
        children: popups.as(popup => popup.map(Popup))
    })
})
