import QtQuick 2.0
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.12

Item {
    id: _leftview
    width: root.width * 0.60
    height: root.height * 1
    property string username: ""

    Rectangle {
        id: _rect_leftview
        width: root.width * 0.60
        height: root.height * 1
        color: "#2c2c54"

    }

    Image {
        id: _left_screen
        source: "../images/circuit.jpg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        smooth: true
        width: 4000 * 0.124
        height: 6000 * 0.102

//        x: root.width * 0.05
//        y: root.height * 0.15
    }



//    DropShadow {
//        anchors.fill: _left_screen
//        horizontalOffset: 10
//        verticalOffset: 10
//        radius: 13.0
//        samples: 17
//        color: "#80000000"
//        source: _left_screen
//    }

//     FastBlur {
//        anchors.fill: _left_screen
//        source: _left_screen
//        radius: 32
//    }
     Item {
         id: tmp_logo
         x: _leftview.width / 4 - 47
         y: _leftview.height / 4 - 87
         visible: true
//         anchors.verticalCenter: parent.verticalCenter
//         anchors.horizontalCenter: parent.horizontalCenter

         Rectangle {
             width: 480
             height: 600
             color: "#e0ffffff"

         }
         Item {
             id: first_item


             Rectangle {


                 width: 480
                 height: 100
                 color: "#2c2c54"

             }
             Text {

                 text: qsTr("Admin access")
                 color: "white"
                 font.pointSize: 40
                 x: root.width * 0.09
                 y: root.height * 0.02

             }

             Image {
                 source: "file:/home/bm7/eyeloop/images/avatar.png"
                 x: 25
                 y: 10.5
//                     scale: 0.3
             }

             Rectangle {
                 color: "#2c2c54"
                 width: 30
                 height: 30
                 x: 160
                 y: 140
             }
             Rectangle {
                 color: "#2c2c54"
                 width: 30
                 height: 30
                 x: 230
                 y: 140
             }
             Rectangle {
                 color: "#2c2c54"
                 width: 30
                 height: 30
                 x: 300
                 y: 140
             }
             // ==========================================================================================

             Text {
                 id: label_username
                 text: qsTr("Username :")
                 color: "#2c2c54"
                 x: 60
                 y: 250
                 font.pointSize: 20
             }
             TextField {
                 id: input_username
                 placeholderText: "Enter username or email"
                 x: 220
                 y: 250

                 background: Rectangle {
                      implicitWidth: 200
                      implicitHeight: 40
                      radius: 3
                      color: input_username.enabled ? "transparent" : "#2c2c54"
                      border.color: input_username.enabled ? "#2c2c54" : "transparent"
                 }
             }

             // ==========================================================================================

             Text {
                 id: label_password
                 text: qsTr("Password :")
                 color: "#2c2c54"
                 x: 60
                 y: 320
                 font.pointSize: 20
             }
             TextField {
                 id: input_password
                 placeholderText: "Enter password"
                 echoMode: TextInput.Password
                 x: 220
                 y: 320

                 background: Rectangle {
                      implicitWidth: 200
                      implicitHeight: 40
                      radius: 3
                      color: input_password.enabled ? "transparent" : "#2c2c54"
                      border.color: input_password.enabled ? "#2c2c54" : "transparent"
                 }
             }
             // ==========================================================================================
            Button {
                id: register
                x: 90
                y: 430
                visible: false
                text: "Register"
                contentItem: Text {
                    text: register.text
                    color: register.down ? "#17a81a" : "2c2c54"
                    font.pointSize: 20
                }

                background: Rectangle {
                    color: "white"
                    radius: 4
                }
            }
             // ==========================================================================================
            Button {
                id: login
                x: 270
                y: 430
                text: "Login"
                contentItem: Text {
                    text: login.text
                    color: login.down ? "#17a81a" : "white"
                    font.pointSize: 20
                }

                background: Rectangle {
                    color: "#2c2c54"
                    radius: 4
                }
            }
            // ==========================================================================================

         }
     }

}
