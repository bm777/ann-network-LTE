import QtQuick 2.12
import QtQuick.Window 2.12
import "script.js" as Logic

Window {
        visible: true
        width: 320
        height: 480
        Item {
            id: name
            width: 320
            height: 480
            visible: true

            Rectangle {
                color: "#272822"
                width: 320
                height: 480
            }
            TapHandler {
                onTapped: rectangle.rotation = Logic.getRandom(rectangle.rotation)
            }

            Rectangle {
                id: rectangle
                width: 160
                height: 160
                anchors.centerIn: parent
                color: "green"
                Behavior on rotation {
                    RotationAnimation { direction: RotationAnimation.Clockwise }
                }
            }
        }

}
