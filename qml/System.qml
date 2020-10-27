import QtQuick 2.15
import QtGraphicalEffects 1.0

Item {
    width: root.width
    height: root.height
    x: 0
    y:0
    ValueSource {
        id: valueSource
    }

    Rectangle {
        width: parent.width
        id: roundRect
        x: 0
        y:-20
        radius: 20
        height: parent.height  * 0.6
        gradient: Gradient {
                    GradientStop { position: 0.0; color: "#780000ff"}
                    GradientStop { position: 1.0; color: "#2800000f"}
                }
        Text {
            id: text_over_blur
            text: qsTr("")
        }
        Rectangle {
            id: rect
            anchors.centerIn: parent
            height: 200
            radius: 10
            width: 600
            color: "white"
            Item {
                id: general_1
                width: rect.width
                height: rect.height
                Text {
                    anchors.centerIn: general_1
                    text: qsTr("Commençer par importer le fichier <b>log</b> pour les analyses.")
                    color: "#a8000000"
                    font.pointSize: 15
                    font.italic: true
                }
            }
        }
        DropShadow {
        anchors.fill: rect
//        cached: true
        horizontalOffset: 5
        verticalOffset: 5
        radius: 8
        samples: 17
        color: "#80000000"
        source: rect
        }
    }
//    "Fichier log sont les fichier
//    qui montre le comportement
//    des BTS par les paramètres
//           spatio-temporels.
//    Ses extensions: *.log, *.txt"
    Item {
        id: bottom_infos
        width: root.width
        height: roundRect.height
        y: roundRect.height + 20

        Row {
            width: root.width
            height: roundRect.height
            spacing: 200
            x: root.width * 0.11

            // ================================log======================================
            Item {
                height: 220
                width: 200

                Rectangle {
                    radius: width / 2
                    width: 90
                    height: 90
                    y: 5
                    color: "#289c88ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                 }
                    Image {
                        source: "../images/log.png"
                        scale: 0.73
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                Item {
//                    color: "blue"
                    y: 120
                    height: 130
                    width: 200
                    Text {
                        id: text_log
                        text: "<b>Importer</b>"
                        font.pointSize: 20
                        color: "#a8000000"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        width: 200
                        height: 110
                        y: 40
                        Text {
                            id: log
                            text: "Ses extensions: *.log, *.txt"
                            font.pointSize: 12
                            color: "#a8000000"
//                            anchors.fill: parentsr
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                // ============================== button hover
                Rectangle {
                    id: _left
                    width: 230
                    height: 230
                    x: -15
                    y: -10
                    radius: 10
                    color: valueSource.state_import === "InMouse" ? "#189c88ff" : "transparent"
                    MouseArea {
                        anchors.fill: _left
                        hoverEnabled: true
                        onEntered: {
                            valueSource.state_import = "InMouse";
                        }
                        onExited: {
                            if (valueSource.state_import === "OutMouse"){
                                valueSource.state_import = "InMouse";
                            }
                            if (valueSource.state_import !== "OutMouse"){
                                valueSource.state_import = "OutMouse";
                            }
                        }
                        onClicked: {

                        }
                    }
                }
                // ==============================
            }
            // ============================================================================

            // ===================================config====================================
            Item {
                height: 220
                width: 200
                Rectangle {
                    radius: width / 2
                    width: 90
                    height: 90
                    y: 5
                    color: "#289c88ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                 }
                    Image {
                        source: "../images/config.png"
                        scale: 0.73
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                Item {
//                    color: "blue"
                    y: 120
                    height: 130
                    width: 200
                    Text {
                        id: text_config
                        text: "<b>Config</b>"
                        font.pointSize: 20
                        color: "#a8000000"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        width: 200
                        height: 110
                        y: 40
                        Text {
                            id: config
                            text: "Prenez  les   commandes. "
                            font.pointSize: 12
                            color: "#a8000000"
//                            anchors.fill: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                // ============================== button hover
                Rectangle {
                    id: _middle // here
                    width: 230
                    height: 230
                    x: -15
                    y: -10
                    radius: 10
                    color: valueSource.state_config === "InMouse" ? "#189c88ff" : "transparent"
                    MouseArea {
                        anchors.fill: _middle // here
                        hoverEnabled: true
                        onEntered: {
                            valueSource.state_config = "InMouse";
                        }
                        onExited: {
                            if (valueSource.state_config === "OutMouse"){
                                valueSource.state_config = "InMouse";
                            }
                            if (valueSource.state_config !== "OutMouse"){
                                valueSource.state_config = "OutMouse";
                            }
                        }
                        onClicked: {

                        }
                    }
                }
                // ==============================
            }
            // ============================================================================

            // ===================================config====================================
            Item {
                height: 220
                width: 200
                Rectangle {
                    radius: width / 2
                    width: 90
                    height: 90
                    y: 5
                    color: "#289c88ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                 }
                    Image {
                        source: "../images/result.png"
                        scale: 0.73
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                Item {
//                    color: "blue"
                    y: 120
                    height: 130
                    width: 200
                    Text {
                        id: text_result
                        text: "<b>Lancer</b>"
                        font.pointSize: 20
                        color: "#a8000000"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        width: 200
                        height: 110
                        y: 40
                        Text {
                            id: result
                            text: "Analyse."
                            font.pointSize: 12
                            color: "#a8000000"
//                            anchors.fill: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                // ============================== button hover
                Rectangle {
                    id: _right
                    width: 230
                    height: 230
                    x: -15
                    y: -10
                    radius: 10
                    color: valueSource.state_result === "InMouse" ? "#189c88ff" : "transparent"
                    MouseArea {
                        anchors.fill: _right
                        hoverEnabled: true
                        onEntered: {
                            valueSource.state_result = "InMouse";
                        }
                        onExited: {
                            if (valueSource.state_result === "OutMouse"){
                                valueSource.state_result = "InMouse";
                            }
                            if (valueSource.state_result !== "OutMouse"){
                                valueSource.state_result = "OutMouse";
                            }
                        }
                        onClicked: {

                        }
                    }
                }
                // ==============================
            }
            // ============================================================================


        }


    }




}
