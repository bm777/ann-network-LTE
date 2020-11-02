import QtQuick 2.12
import QtQuick.Controls 2.12

    Switch {
        id: control_switch
        text: "Switch"

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: control_switch.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: control_switch.checked ? "#17a81a" : "#ffffff"
            border.color: control_switch.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: control_switch.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                color: control_switch.down ? "#cccccc" : "#ffffff"
                border.color: control_switch.checked ? (control_switch.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        contentItem: Text {
            text: control_switch.text
            font: control_switch.font
            opacity: enabled ? 1.0 : 0.3
            color: control_switch.down ? "#17a81a" : "#21be2b"
            leftPadding: control_switch.width - control_switch.spacing
        }
    }
