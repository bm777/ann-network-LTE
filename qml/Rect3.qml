import QtQuick 2.0

Item {
    id: container
    width: 320
    height: 60
    visible: true

    Rectangle {
        id: react
        color: "yellow"
        width: 60
        height: 60
        x: root.width * 0.715
        y: root.height * 0.46
        SequentialAnimation on x {
            id: xAnim
            //running: false
            loops: Animation.Infinite

            NumberAnimation {
                from: root.width * 0.65 +0
                to: root.width * 0.65 + 325
                duration: 700
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                from: root.width * 0.65 + 325
                to: root.width * 0.65 +0
                duration: 700
                easing.type: Easing.InOutQuad
            }

        }

        }
    }
