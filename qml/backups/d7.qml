import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 300
    height: 200

    Item {
    id: container
    width: 200
    height: 200
    visible: true

    Rectangle {
        width: 80
        height: 80
        color: "orange"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20
    }
    Rectangle {
        width: 80
        height: 80
        color: "green"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
    }
 }
    Item {
        id: _
        width: 300; height: 100
        anchors.bottom: parent.bottom
        Row {
            spacing: 20
            Rectangle { width: 80; height: 80; color: "red" }
            Rectangle { width: 80; height: 80; color: "green" }
            Rectangle { width: 80; height: 80; color: "blue" }
        }
    }
}
