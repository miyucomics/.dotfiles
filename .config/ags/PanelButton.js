export default ({ window = "", child, setup, ...rest }) =>
    Widget.EventBox({
        child: child,
        onPrimaryClick: () => App.toggleWindow(window),
        setup: self => {
            let open = false
            self.toggleClassName(window)
            self.toggleClassName("panel-button")
            self.hook(App, (_, win, visible) => {
                if (win !== window) return
                if (open && !visible) open = false
                if (visible) open = true
            })
        },
        ...rest
    })
