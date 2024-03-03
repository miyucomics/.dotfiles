const hyprland = await Service.import("hyprland")

export default () => {
    const activeId = hyprland.active.workspace.bind("id")
    return Widget.EventBox({
        onScrollUp: () => {
            if (hyprland.active.workspace.id < 9) hyprland.messageAsync(`dispatch workspace +1`)
        },
        onScrollDown: () => {
            if (hyprland.active.workspace.id > 0) hyprland.messageAsync(`dispatch workspace -1`)
        },
        child: Widget.Box({
            class_name: "workspaces",
            spacing: 15,
            children: [1, 2, 3, 4, 5, 6, 7, 8, 9].map(id =>
                Widget.EventBox({
                    on_primary_click: () => hyprland.messageAsync(`dispatch workspace ${id}`),
                    child: Widget.Icon({
                        icon: activeId.as(i => `radio-${i == id ? "checked-" : ""}symbolic`),
                        setup: self =>
                            self.hook(hyprland, (self, _) => self.toggleClassName("occupied", (hyprland.getWorkspace(id)?.windows || 0) > 0)),
                        className: "workspace"
                    })
                })
            )
        })
    })
}
