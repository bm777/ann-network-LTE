import QtQuick 2.15
import QtGraphicalEffects 1.0
//import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
//import QtQuick.Controls.Styles 2.15
import "operations.js" as Logic

Item {
    width: root.width
    height: root.height
    x: 0
    y:0

    ValueSource {
        id: valueSource
    }

    Image {
        id: refresh
        rotation: 0
        scale: 0.7
        x: root.width - refresh.width
        source: "../images/refresh.png"
    }
    Rectangle {
        id: rec_r
        width: refresh.width * 0.7
        height: refresh.height * 0.7
        x: root.width - refresh.width * 0.85
        y: 17
        radius: 10
        color: state === "InMouse" ? "#309c88ff" : "transparent"
        state: "OutMouse"
//        anchors.fill: refresh
        states: [
            State {
                name: "OutMouse"
                PropertyChanges {
                    target: rec_r; color: "transparent"
                }
            },
            State {
                name: "InMouse"
                PropertyChanges {
                    target: rec_r; color: "#189c88ff"
                }
            },
            State {
                name: "Clicked"
                PropertyChanges {
                    target: rec_r; color: "#189c88ff"; //159c88ff
                }
            }
        ]
        MouseArea {
            anchors.fill: rec_r
            hoverEnabled: true
            onEntered: {
                rec_r.state = "InMouse";
//                console.log("onEntered");
            }
            onClicked: {
                _left.state = "OutMouse";
                _middle.state = "OutMouse";
                console.log("inside on clicked");
                if(rect.width === 900){
                    _right.state = "Out";
                   item_log.visible = true;
                }
                last.visible = false;
                rec_r.state = "Clicked";
                progress.value = 0.0
            }
            onExited: {
                rec_r.state = "OutMouse"
            }
        }
        NumberAnimation {
            target: refresh
            running: rec_r.state === "InMouse" ? true : false
            property: "rotation"
            from: refresh.rotation
            to: refresh.rotation + 180
            duration: 500
//            easing.type: Easing.InOutQuad
        }

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
//            implicitHeight: 200 + 100
//            implicitWidth: 600 +300
            height: 200
            radius: 10
            width: 600
            color: "white"
            Item {
                id: general_1
                width: rect.width
                height: rect.height

                Text {
                    id: item_log
                    anchors.centerIn: general_1
                    text: qsTr("Commençer par importer le fichier <b>log</b> pour les analyses.")
                    color: "#a8000000"
                    font.pointSize: 15
                    font.italic: true
                    visible: true


                    NumberAnimation {
                        target: item_log
                        running: item_log.visible
                        property: "opacity"
                        from: 0.0
                        to: 1.0
                        duration: 1500
                        easing.type: Easing.InOutQuad
                    }
                }
                Item {
                    id: item_config
                    anchors.fill: parent
                    visible: false
                    Row {
                        anchors.centerIn: parent
                        Switch {
                            id: select1
                            text: "Utiliser les threads"
                            background: Rectangle {
                                color: select1.down ? "#289c88ff" : "#fff"
                                radius: 20
                            }
                            TapHandler {
                                id: handler1
                                onTapped: {
                                     console.log("state1 == " + select1.checked + ", state2 == " + select2.checked);
                                }
                            }

                        }
                        Switch {
                            id: select2
                            text: "Afficher le Pourcentage"
                            background: Rectangle {
                                color: select2.down ? "#289c88ff" : "#fff"
                                radius: 20
                            }
                            TapHandler {
                                id: handler2
                                onTapped: {
                                     console.log("state1 == " + select1.checked + "; state2 == " + select2.checked);
                                }
                            }
                        }
                    }
                    Text {
                        id: trans
                        text: qsTr("Appuyer sur le boutton <b>Lancer</b> pour analyser.")
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 150
                        font.pointSize: 15
                        font.italic: true
                        visible: true
                    }
                }
                Item {
                    id: last
                    anchors.centerIn: parent
                    visible: false

                    Text {
                        id: text_last
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: select2.checked ? bridge.data1 + "%" : bridge.data1
                        y: -20
                        Behavior on text {
                            NumberAnimation {running: select1.checked ? true : false; duration: select1.checked ? 2000 : 3000}
                        }
                    }


                    ProgressBar {
                        id: progress
                        value: bridge.data2
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 500
                        y: 50
                        contentItem: Rectangle {
                                        anchors.left: progress.left
                                        anchors.verticalCenter: progress.verticalCenter
                                        width: progress.visualPosition * progress.width
                                        height: progress.height
                                        radius: 2
                                        color: "#780000ff"
                                        //z: 10
                                    }

                        Behavior on value {
                            NumberAnimation {duration: select1.checked ? 2000 : 3000}
                        }
                    }


                }

            }
            //==================================
            NumberAnimation {
                target: rect
                running: (_right.state === "Out") ? true : false
                property: "height"
                from: rect.height
                to: rect.height - 100
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: rect
                running: (_right.state === "Out") ? true : false
                property: "width"
                from: rect.width
                to: rect.width - 300
                duration: 500
                easing.type: Easing.InOutQuad
            }

        }
        DropShadow {
        anchors.fill: rect
//        cached: true
        horizontalOffset: 5
        verticalOffset: 5
        radius: 8
        samples: 17
        width: 640
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
                    color: state === "InMouse" ? "#189c88ff" : "transparent"

                    // ===========================================
                    state: "OutMouse"
                    states: [
                        State {
                            name: "OutMouse"
                            PropertyChanges {
                                target: _left; color: "transparent"
                            }
                        },
                        State {
                            name: "InMouse"
                            PropertyChanges {
                                target: _left; color: "#189c88ff"
                            }
                        },
                        State {
                            name: "Clicked"
                            PropertyChanges {
                                target: _left; color: "#189c88ff"; //159c88ff
                            }
                        }
                    ]
                    // ===========================================
                    MouseArea {
                        anchors.fill: _left
                        hoverEnabled: true
                        onEntered: {
                            if (_left.state === "Clicked"){
                                _left.state = "Clicked";
                            }else{
                                _left.state = "InMouse";
//                                console.log("Ici");
                            }
                        }
                        onExited: {
                            if (_left.state === "InMouse"){
                                _left.state = "OutMouse";
                            }
                            if (_left.state === "Clicked"){
                                _left.state = "Clicked";
                            }
                        }
                        onClicked: {
                            _left.state = "Clicked";
                            fd.visible = true;
//                            fd.open();
                        }
                    }
                }
                Rectangle {
                    id: rect12
                    width: 170
                    height: 10
                    color: _middle.state === "Clicked" ? "#189c88ff" : "transparent"
                    x: _left.width - 15
                    y: _left.height / 2

                }

                // ==============================
            }
            // ============================================================================
            FileDialog {
                id: fd
                title: "Please choose a file"
                nameFilters: ["All files (*)"]
//                folder: shortcuts.home
        //        visible: false


                onAccepted: {

                    if (Logic.check(fd.file)) {
                        console.log("You choose: " + fd.file);

                        _left.state = "Clicked";
                        _middle.state = "Clicked"
                        item_log.visible = false;
                        item_config.visible = true;
                        console.log("from python1: " + bridge.data1);
                        console.log("from python2: " + bridge.data2);
                    } else {

                    }
                }
                onRejected: {
                    console.log("Cancelled")
                    _left.state = "OutMouse";
                    _middle.state = "OutMouse";
                    _right.state = "OutMouse"
                }
               Component.onCompleted: visible = false;
            }


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
                    color: state === "InMouse" ? "#189c88ff" : "transparent"
                    // ===========================================
                    state: "OutMouse"
                    states: [
                        State {
                            name: "OutMouse"
                            PropertyChanges {
                                target: _middle; color: "transparent"
                            }
                        },
                        State {
                            name: "InMouse"
                            PropertyChanges {
                                target: _middle; color: "#189c88ff"
                            }
                        },
                        State {
                            name: "Clicked"
                            PropertyChanges {
                                target: _middle; color: "#189c88ff"; //159c88ff
                            }
                        }
                    ]
                    // ===========================================
                    MouseArea {
                        anchors.fill: _middle // here
                        hoverEnabled: true
                        onEntered: {
                            if (_middle.state === "Clicked"){
                                _middle.state = "Clicked";
                            }else{
                                _middle.state = "InMouse"
                            }
                        }
                        onExited: {
                            if (_middle.state === "InMouse"){
                                _middle.state = "OutMouse";
                            }
                            if (_middle.state === "Clicked"){
                                _middle.state = "Clicked";
                            }
                        }
                        onClicked: {
                            if(_left.state === "Clicked"){
                             _middle.state = "Clicked";

                           }
                        }
                    }
                }
                Rectangle {
                    id: rect23
                    width: 170
                    height: 10
                    color: _right.state === "Clicked" ? "#189c88ff" : "transparent"
                    x: _middle.width - 15
                    y: _middle.height / 2

                }
                // ==============================
            }
            // ============================================================================

            // ===================================lancer====================================
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
                    color: state === "InMouse" ? "#189c88ff" : "transparent"
                    // ===========================================
                    state: "OutMouse"
                    states: [
                        State {
                            name: "OutMouse"
                            PropertyChanges {
                                target: _right; color: "transparent"
                            }
                        },
                        State {
                            name: "Out"
                            PropertyChanges {
//                                target: _right; color: "transparent"
                            }
                        },
                        State {
                            name: "InMouse"
                            PropertyChanges {
                                target: _right; color: "#189c88ff"
                            }
                        },
                        State {
                            name: "Clicked"
                            PropertyChanges {
                                target: _right; color: "#189c88ff"; //159c88ff
                            }
                        }
                    ]
                    // ===========================================
                    MouseArea {
                        anchors.fill: _right
                        hoverEnabled: true
                        onEntered: {
                            if (_right.state === "Clicked"){
                                _right.state = "Clicked";
                            }else{
                                _right.state = "InMouse"
                            }
                        }
                        onExited: {
                            if (_right.state === "InMouse"){
                                _right.state = "OutMouse";
                            }
                            if (_right.state === "Clicked"){
                                _right.state = "Clicked";
                            }
                        }
                        onClicked: {
                            if(_middle.state === "Clicked"){
                                _right.state = "Clicked";
                                item_config.visible = false;
                                last.visible = true;
                                bridge.loadUrl(fd.file);
                           }
                        }
                    }
                    NumberAnimation {
                        target: rect
                        running: _right.state === "Clicked" ? true : false
                        property: "height"
                        from: rect.height
                        to: rect.height + 100
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: rect
                        running:  _right.state === "Clicked" ? true : false
                        property: "width"
                        from: rect.width
                        to: rect.width + 300
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                    // ==========reverse =====================

                }
                // ==============================
            }
            // ============================================================================

        }

    }

}
