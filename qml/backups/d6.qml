import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 480
    height: 320

    Item {
    id: container
    width: 480
    height: 320
    visible: true

    Rectangle {
        color: "#272822"
        width: 480
        height: 320
        }
    Column {
        spacing: 20
        Text {
            id: text
            text: qsTr("I am the very model of a modern major general!")
            color: "yellow"
        }
        Text {
            width: root.width
            wrapMode: Text.WordWrap
            text: qsTr("I am very model of model major general. I\'ve information
vegetable, animal and mineral. I know the kings of england and I
quote the flights historical; from Marathon to Waterloo in order categorical.")
            color: "white"
        }
        Text {

            text: qsTr("I am the very model of a modern major general!")
            color: "yellow"
            font {
                family: 'Courier'
                pixelSize: 20
                italic: true
                capitalization: Font.SmallCaps
            }
        }
        Text {

            text: qsTr('<font color="white">I am the <b>very</b> model of a modern <i>major general</i>!</font>')
            font.pointSize: 14
            textFormat: Text.StyledText
        }
    }
    }
}
