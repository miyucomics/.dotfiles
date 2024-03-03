import workspaces from "./modules/workspaces.ts"
import media from "./modules/media.ts"
import title from "./modules/title.ts"
import volume from "./modules/volume.ts"
import clock from "./modules/clock.ts"

const Bar = () =>
	Widget.Window({
		name: "bar",
		class_name: "bar",
		anchor: ["top", "left", "right"],
		child: Widget.CenterBox({
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

export default {
	style: "./style.css",
	windows: [Bar()]
}
