import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.modules.common

Scope {
    Variants {
        model: Quickshell.screens
        
        LazyLoader {
            required property ShellScreen modelData
            active: true
            
            component: Scope {
                // Top border
                PanelWindow {
                    screen: modelData
                    anchors {
                        top: true
                        left: true
                        right: true
                    }
                    height: 20
                    color: Appearance.colors.colLayer0
                    WlrLayershell.namespace: "quickshell:screenBorder"
                    WlrLayershell.layer: WlrLayer.Top
                    exclusionMode: ExclusionMode.Normal
                    exclusiveZone: 20
                }
                
                // Left border
                PanelWindow {
                    screen: modelData
                    anchors {
                        top: true
                        bottom: true
                        left: true
                    }
                    width: 20
                    color: Appearance.colors.colLayer0
                    WlrLayershell.namespace: "quickshell:screenBorder"
                    WlrLayershell.layer: WlrLayer.Top
                    exclusionMode: ExclusionMode.Normal
                    exclusiveZone: 20
                }
                
                // Right border
                PanelWindow {
                    screen: modelData
                    anchors {
                        top: true
                        bottom: true
                        right: true
                    }
                    width: 20
                    color: Appearance.colors.colLayer0
                    WlrLayershell.namespace: "quickshell:screenBorder"
                    WlrLayershell.layer: WlrLayer.Top
                    exclusionMode: ExclusionMode.Normal
                    exclusiveZone: 20
                }
            }
        }
    }
}
