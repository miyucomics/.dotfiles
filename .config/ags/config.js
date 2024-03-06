import bar from "./bar/bar.js"
import notification from "./notifications/notifications.js"
import DateMenu from "./datemenu/DateMenu.js"

App.config({
    style: "./style.css",
    onConfigParsed: () => {
        App.addWindow(DateMenu())
    },
    windows: [bar, notification]
})
