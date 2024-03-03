import workspaces from "./workspaces.ts"
import media from "./media.ts"
import title from "./title.ts"
import progression from "./progression.ts"
import volume from "./volume.ts"
import clock from "./clock.ts"

export default Widget.Window({
    name: "bar",
    class_name: "bar",
    anchor: ["top", "left", "right"],
    margins: [10, 6],
    child: Widget.CenterBox({
        start_widget: Widget.Box({
            spacing: 8,
            children: [workspaces(), media()]
        }),
        center_widget: Widget.Box({
            spacing: 8,
            children: [title(), progression()]
        }),
        end_widget: Widget.Box({
            hpack: "end",
            spacing: 8,
            children: [volume(), clock()]
        })
    })
})
