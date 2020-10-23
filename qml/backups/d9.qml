import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1100
    height: 460
    Item {
        id: name
        visible: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: control
            text: qsTr("Rover")


            contentItem: Text {
                text: control.text
                font: control.font
                opacity: enabled ? 1.0 : 0.3
                color: control.down ?  "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter


            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                border.color: control.down ? "#17a81a" : "#21be2b"
                opacity: enable ? 1 : 0.3
                border.width: 1
                radius: 2
//                gradient: Gradient {
//                    GradientStop { position: 0; color: control.pressed ? "#17a81a" : "#21be2b" }
//                    GradientStop { position: 1; color: control.pressed ? "#21be2b" : "#17a81a" }
//                }
            }

        }
    }

}
