import PopupWindow from "../PopupWindow.js"
import NotificationColumn from "./NotificationColumn.js"
import DateColumn from "./DateColumn.js"

export default () =>
    PopupWindow({
        layout: "top",
        name: "datemenu",
        transition: "slide_down",
        child: Widget.Box({
            class_name: "datemenu",
            children: [NotificationColumn(), DateColumn()],
            vexpand: false
        })
    })
