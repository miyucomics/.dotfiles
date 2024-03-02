const hyprland = await Service.import("hyprland")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")

const date = Variable("", {
    poll: [1000, 'date "+%H:%M:%S %b %e."']
})

function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    return Widget.Box({
        class_name: "workspaces",
        children: [1, 2, 3, 4, 5, 6, 7, 8, 9].map(id =>
            Widget.Button({
                on_clicked: () =>
                    hyprland.messageAsync(`dispatch workspace ${id}`),
                child: Widget.Icon("radio-symbolic"),
                class_name: activeId.as(i => `${i === id ? "focused" : ""}`)
            })
        )
    })
}

const ClientTitle = () =>
    Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title")
    })

const Clock = () =>
    Widget.Label({
        class_name: "clock",
        label: date.bind()
    })

const Media = () =>
    Widget.Button({
        class_name: "media",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label("-").hook(
            mpris,
            self => {
                if (mpris.players[0]) {
                    const { track_artists, track_title } = mpris.players[0]
                    self.label = `${track_artists.join(", ")} - ${track_title}`
                } else {
                    self.label = "Nothing is playing"
                }
            },
            "player-changed"
        )
    })

const Volume = () =>
    Widget.Box({
        class_name: "volume",
        children: [
            Widget.Icon().hook(audio.speaker, self => {
                const mapping = {
                    101: "overamplified",
                    67: "high",
                    34: "medium",
                    1: "low",
                    0: "muted"
                }

                const icon = audio.speaker.is_muted
                    ? 0
                    : [101, 67, 34, 1, 0].find(
                        threshold => threshold <= audio.speaker.volume * 100
                    )

                self.icon = `audio-volume-${mapping[icon]}-symbolic`
            }),
            Widget.Label({
                hexpand: true,
                setup: self =>
                    self.hook(audio.speaker, () => {
                        self.label = Math.floor(
                            (audio.speaker.volume || 0) * 100
                        ).toString()
                    })
            })
        ]
    })

const Left = () =>
    Widget.Box({
        spacing: 8,
        children: [Workspaces(), Media()]
    })

const Center = () =>
    Widget.Box({
        spacing: 8,
        children: [ClientTitle()]
    })

const Right = () =>
    Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [Volume(), Clock()]
    })

const Bar = () =>
    Widget.Window({
        name: "bar",
        class_name: "bar",
        anchor: ["top", "left", "right"],
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right()
        })
    })

export default {
    style: "./style.css",
    windows: [Bar()]
}
