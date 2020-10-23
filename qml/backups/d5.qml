import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 320
    height: 120

    Item {
    id: container
    width: 320
    height: 120
    visible: true

    Rectangle {
        id: react
        color: "blue"
        width: 120
        height: 120
        SequentialAnimation on x {
            id: xAnim
            running: false
            //loops: Animation.Infinite

            NumberAnimation {
                from: 0
                to: 200
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                from: 200
                to: 0
                duration: 500
                easing.type: Easing.InOutQuad
            }
            PauseAnimation {
                duration: 250
            }


        }
        TapHandler {
            onTapped: xAnim.running = true
        }

        }
    }
    Item {
        width: 320
        height: 120

        Rectangle {
            id: rectangle
            width: 120
            height: 120
            color: "yellow"

            TapHandler {
                onTapped: anim.running = true
            }
        }
    }
    SequentialAnimation {
        id: anim

        NumberAnimation {
            target: rectangle
            property: "x"
            duration: 500
            from: 0
            to: 200


        }
        NumberAnimation {
            target: rectangle
            property: "x"
            duration: 500
            from: 200
            to: 0
        }
    }
}
