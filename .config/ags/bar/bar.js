import workspaces from "./modules/workspaces.js"
import media from "./modules/media.js"
import title from "./modules/title.js"
import volume from "./modules/volume.js"
import clock from "./modules/clock.js"

export default Widget.Window({
    name: "bar",
    class_name: "bar",
    margins: [10, 10],
    anchor: ["top", "left", "right"],
    child: Widget.CenterBox({
        className: "bar-container",
        start_widget: Widget.Box({
            spacing: 8,
            children: [workspaces(), media()]
        }),
        center_widget: Widget.Box({
            spacing: 8,
            children: [title()]
        }),
        end_widget: Widget.Box({
            hpack: "end",
            spacing: 8,
            children: [volume(), clock()]
        })
    })
})
