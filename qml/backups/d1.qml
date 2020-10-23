import QtQuick 2.0
import QtQuick.Window 2.0

Window {
    visible: true
    width: 320
    height: 480



        Rectangle {
            color: "#272822"
            width: 320
            height: 480
        }


            Rectangle {
                rotation: 45
                x: 20
                y: 160
                width: 100
                height: 100
                color: "blue"

            }

            Rectangle {
                id: topRect
//                opacity: 0.5
                scale: 0.5 // resize
                x: 160
                y: 160
                width: 100
                height: 100
                color: "green"
                MouseArea {
                    anchors.fill: parent
                    onPositionChanged: topRect.y += 1
                }
            }


    }


