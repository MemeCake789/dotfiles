import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

Scope {
    id: notificationPopup

    PanelWindow {
        id: root
        visible: (Notifications.popupList.length > 0) && !GlobalStates.screenLocked
        screen: Quickshell.screens.find(s => s.name === Hyprland.focusedMonitor?.name) ?? null

        WlrLayershell.namespace: "quickshell:notificationPopup"
        WlrLayershell.layer: WlrLayer.Overlay
        exclusiveZone: Config.options.bar.vertical ? Appearance.sizes.verticalBarWidth : Appearance.sizes.barHeight

        anchors {
            top: !Config.options.bar.bottom || Config.options.bar.vertical
            bottom: Config.options.bar.bottom && !Config.options.bar.vertical
            left: !(Config.options.bar.vertical && Config.options.bar.bottom)
            right: Config.options.bar.vertical && Config.options.bar.bottom
        }
        margins {
            top: Config.options.bar.vertical ? 0 : Appearance.sizes.barHeight
            bottom: Config.options.bar.bottom ? 0 : Appearance.sizes.barHeight
            left: Config.options.bar.vertical ? Appearance.sizes.verticalBarWidth : 0
            right: Config.options.bar.vertical ? Appearance.sizes.verticalBarWidth : 0
        }

        mask: Region {
            item: listview.contentItem
        }

        color: "transparent"
        implicitWidth: Appearance.sizes.notificationPopupWidth

        NotificationListView {
            id: listview
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                leftMargin: Config.options.bar.vertical ? 4 : 0
                rightMargin: Config.options.bar.vertical ? 4 : 0
                topMargin: Config.options.bar.vertical ? 4 : 0
                bottomMargin: Config.options.bar.vertical ? 4 : 0
            }
            implicitWidth: parent.width - Appearance.sizes.elevationMargin * 2
            popup: true
        }
    }
}
