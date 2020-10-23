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
        color: "green"
        width: 120
        height: 120

        Behavior on x{
            NumberAnimation {
                duration: 700
                easing.type: Easing.OutBounce
            }
        }
        Behavior on y{
            NumberAnimation {
                duration: 700
                easing.type: Easing.OutBounce
            }
        }
        TapHandler {
            onTapped: parent.x === 0 ? parent.x = 200 : parent.x = 0

        }
        TapHandler {
            onTapped: parent.y === 0 ? parent.y = 200 : parent.y = 0

        }
    }



    }
}
