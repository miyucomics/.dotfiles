const audio = await Service.import("audio")

export default () =>
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
                const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(threshold => threshold <= audio.speaker.volume * 100)
                if (icon == undefined) return
                self.icon = `audio-volume-${mapping[icon]}-symbolic`
            }),
            Widget.Label({
                hexpand: true,
                setup: self =>
                    self.hook(audio.speaker, () => {
                        self.label = Math.floor((audio.speaker.volume || 0) * 100).toString()
                    })
            })
        ]
    })
