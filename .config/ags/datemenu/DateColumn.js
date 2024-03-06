export default () =>
    Widget.Box({
        vertical: true,
        class_name: "date-column",
        child: Widget.Calendar({
            class_name: "calendar",
            hexpand: true,
            hpack: "center"
        })
    })
