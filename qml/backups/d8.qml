import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1100
    height: 460
    GroupBox {
        id: gridBox
        Layout.fillWidth: true
        title: "Grid Layout"

        GridLayout {
            id: gridLayout
            rows: 3
            flow: GridLayout.TopToBottom
            anchors.fill: parent
            Label { text: "Line 1" }
            Label { text: "Line 2" }
            Label { text: "Line 3" }

            TextField {  }
            TextField {  }
            TextField {  }

            TextArea {
                text: "This widget spans over three rows in hte GridLayout.\n"
                    + "All itmes in the GridLayout are implicitly positioned from top to bottom."
                Layout.rowSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }


}
