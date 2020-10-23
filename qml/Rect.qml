import QtQuick 2.0

Item {
    width: 320
    height: 60

    Rectangle {
        id: rectangle
        width: 60
        height: 60
        color: "red"
        x: root.width * 0.715
        y: root.height * 0.46
        SequentialAnimation on x{
            loops: Animation.Infinite

            NumberAnimation {
                target: rectangle
                property: "x"
                duration: 700
                from: root.width * 0.65 +0
                to: root.width * 0.65 + 325
            }
            NumberAnimation {
                target: rectangle
                property: "x"
                duration: 700
                from: root.width * 0.65 + 325
                to: root.width * 0.65 +0
            }
            PauseAnimation {
                duration: 150
            }
        }
    }
}

