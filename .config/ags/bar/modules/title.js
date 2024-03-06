import PanelButton from "../../PanelButton.js"

const hyprland = await Service.import("hyprland")

export default () =>
    PanelButton({
        window: "datemenu",
        child: Widget.Label({
            class_name: "client-title",
            label: hyprland.active.client.bind("title")
        })
    })
