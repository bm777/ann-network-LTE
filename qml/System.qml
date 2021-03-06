import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtCharts 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
//import QtQuick.Controls.Styles 2.15
import QtQuick.LocalStorage 2.15
import "script.js" as Code
// home_color 780000ff
Item {
    id: _root
    width: root.width
    height: root.height
    x: 0
    y:0
    property var list_town: []
    property var list_col: []
    property var axis: []
    property var ord: []
    ValueSource {
        id: valueSource
    }


    Image {
        id: refresh
        rotation: 0
        scale: 0.7
        x: root.width - refresh.width - 40
        source: "../images/refresh.png"
    }
    Image {
        id: menu
        rotation: 0
        scale: 0.4
        x: root.width - menu.width + 25
//        y: 10
        source: "../images/menu.png"
    }
    Rectangle {
        id: rec_r
        width: refresh.width * 0.7
        height: refresh.height * 0.7
        x: root.width - refresh.width - 25
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
                name: "Intermediate"
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
                if(rect.width === 1000){
                    _right.state = "Out"; //out
                   item_log.visible = true;
                }
                _middle.visible=false;
                item_log.visible = true;
                //item_config.visible=false;
                last.visible = false;
                rec_r.state = "Clicked";
//                progress.value = 0.0
            }
            onExited: {
                rec_r.state = "OutMouse";
                rec_r.state = "Intermediate";

            }
        }
        NumberAnimation {
            target: refresh
            running: rec_r.state === "InMouse" ? true : false
            property: "rotation"
            from: 0
            to: 90
            duration: 300
//            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: refresh
            running: rec_r.state === "Intermediate" ? true : false
            property: "rotation"
            from: 90
            to: 0
            duration: 500
//            easing.type: Easing.InOutQuad
        }

    }
    Rectangle {
        id: rect_menu
        width: menu.width * 0.5
        height: menu.height * 0.7
        x: root.width - menu.width * 0.51
        y: 17
        radius: 10
        color: state === "InMouse" ? "#309c88ff" : "transparent"
        state: "OutMouse"
        states: [
            State {
                name: "OutMouse"
                PropertyChanges {
                    target: rect_menu; color: "transparent"
                }
            },
            State {
                name: "Intermediate"
                PropertyChanges {
                    target: rect_menu; color: "transparent"
                }
            },
            State {
                name: "InMouse"
                PropertyChanges {
                    target: rect_menu; color: "#189c88ff"
                }
            },
            State {
                name: "Clicked"
                PropertyChanges {
                    target: rect_menu; color: "#189c88ff"; //159c88ff
                }
            }
        ]
        MouseArea {
            anchors.fill: rect_menu
            hoverEnabled: true
            onEntered: {
                rect_menu.state = "InMouse";
//                console.log("onEntered");
            }
            onClicked: {
                _3point.open();
//                console.log("on");

            }
            onExited: {
                rect_menu.state = "OutMouse";
                rect_menu.state = "Intermediate"
            }
            Menu {
                    id: _3point
//                    y: rect_menu.height

                    MenuItem {
                        text: "Utilisateur..."
                        onTriggered: {
                            shadow.visible = true
                            user.visible = true
                            bottom_infos.visible = false
                        }
                    }

                    MenuItem {
                        text: "Aide !"
                        onTriggered: {
                            shadow.visible = true
                            help.visible = true
                        }
                    }
                    MenuItem {
                        text: "Quitter"
                        shortcut: "Ctrl+Q"
                        onTriggered: Qt.quit()
                    }

            }
        }


        NumberAnimation {
            target: menu
            running: rect_menu.state === "InMouse" ? true : false
            property: "rotation"
            from: 0
            to: 90
            duration: 300
//            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: menu
            running: rect_menu.state === "Intermediate" ? true : false
            property: "rotation"
            from: 90
            to: 0
            duration: 500
//            easing.type: Easing.InOutQuad
        }
    }


    Item {
        id: parent_roundRect
        width: root.width
        height: root.height * 0.6
        y: -20
        visible: true
        Rectangle {
            anchors.fill: parent
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
                            text: qsTr("Veuillez importer le fichier <b>KPI</b> pour la prévision.")
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
                            // ===============================
                            Text {
                                y: 10
                                x: 10
                                id: text_column
                                font.bold: true
                                text: "Colone à prédire"
                            }
                            ComboBox {
                                id: combo_column
                                x: 10
                                y: text_column.height+15
                                model: {
                                    return list_col
                                }

                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "#100000ff"
                                    implicitWidth: 120
                                    radius: 5
                                }
                            }
                            // ===============================
                            Text {
                                y: 10
                                x: 200
                                id: text_ville
                                font.bold: true
                                text: "Ville"
                            }
                            ComboBox {
                                id: combo_ville
                                x: 200
                                y: text_ville.height+15
                                model: {
                                    return list_town
//                                    ["YDEUGW", "DLAUGW"]
                                }

                                background: Rectangle {
                                    color: "transparent"
                                    border.color: "#100000ff"
                                    implicitWidth: 120
                                    radius: 5
                                }
                            }
                            // ====================================
                            TextField {
                                id: input_debut
                                x: 350
                                y: text_ville.height+15
                                placeholderText: "Nombre de jour"
                                background: Rectangle{
                                    color: "transparent"
                                    border.color: "#100000ff"
                                    implicitWidth: 150
                                    radius: 5
                                }
                            }
                            Text {
                                x: 510
                                y: text_ville.height+20
                                font.italic: true
                                text: "10 jours max"
                            }
                            // ====================================
                            TextField {
                                id: input_fin
                                visible: false
                                x: 350
                                y: text_ville.height+70
                                placeholderText: "Date de fin"
                                background: Rectangle{
                                    color: "transparent"
                                    border.color: "#100000ff"
                                    implicitWidth: 150
                                    radius: 5
                                }
                            }
                            Text {
                                x: 510
                                visible: false
                                y: text_ville.height+72
                                font.italic: true
                                text: "jj/mm/aaaa"
                            }
                            Text {
                                x: 100
                                y: text_ville.height+72
                                id: text_model
                                text: "Model utilisé :"
                            }
                            Text {
                                x: 200
                                y: text_ville.height+72
                                id: text_
                                font.bold: true
                                text: "RNN"
                            }

                            Text {
                                id: trans
                                text: qsTr("Appuyer sur le boutton <b>Graphiques</b> pour prédire.")
                                anchors.horizontalCenter: parent.horizontalCenter
                                y: 150
                                font.pointSize: 13
                                opacity: 0.5
                                font.italic: true
                                visible: true
                            }
                        }
                        Item {
                            id: last
                            anchors.centerIn: parent
                            visible: false
//= ============= = = =    = = = ================ = = = = ================ = = = =================
                            Item {
                                id: item_chart
//                                color: "red"
                                width: 600
                                height: 200

                                ChartView {
                                    id: chart
                                    title: "Courbe de prévision de '" + combo_column.currentText +"'"
                                    width: 600 + 400
                                    height: 200 + 130
                                    antialiasing: true
                                    x: - parent.width / 2 - 200
                                    y: - parent.height / 2 - 65

                                    ValueAxis {
                                            id: xAxis
                                            min: 1
                                            max: 20
                                            tickCount: 20
                                        }

                                    SplineSeries {
                                        axisX: xAxis
                                        name: combo_column.currentText

                                               XYPoint { x: 1; y: 99.2 }
                                               XYPoint { x: 2; y: 99.4 }
                                               XYPoint { x: 3; y: 97.1 }
                                               XYPoint { x: 4; y: 98.6 }
                                               XYPoint { x: 5; y: 98.3 }
                                               XYPoint { x: 6; y: 98.1 }
                                               XYPoint { x: 7; y: 100.0 }
                                               XYPoint { x: 8; y: 99.3 }
                                               XYPoint { x: 9; y: 99.1 }
                                               XYPoint { x: 10; y: 98.2 }
                                               XYPoint { x: 11; y: 98.2 }
                                               XYPoint { x: 12; y: 96.4 }
                                               XYPoint { x: 13; y: 97.1 }
                                               XYPoint { x: 14; y: 98.6 }
                                               XYPoint { x: 15; y: 98.3 }
                                               XYPoint { x: 16; y: 98.1 }
                                               XYPoint { x: 17; y: 95.0 }
                                               XYPoint { x: 18; y: 94.3 }
                                               XYPoint { x: 19; y: 96.1 }
                                               XYPoint { x: 20; y: 96.2 }
//                                               XYPoint { x: 21; y: 96.2 }
//                                               XYPoint { x: 22; y: 97.4 }
//                                               XYPoint { x: 23; y: 95.1 }
//                                               XYPoint { x: 24; y: 98.6 }
//                                               XYPoint { x: 25; y: 97.3 }
//                                               XYPoint { x: 26; y: 99.1 }
//                                               XYPoint { x: 27; y: 100.0 }
//                                               XYPoint { x: 28; y: 99.3 }
//                                               XYPoint { x: 29; y: 99.1 }
//                                               XYPoint { x: 30; y: 98.2 }
                                    }
                                    Text {
                                            id: txt
                                            y: parent.height - txt.height * 1.5
                                            x: parent.width - txt.width * 2
                                            text: "<b>Jour<b> (jr)"
//                                            color: "white"
                                        }


                                    NumberAnimation {
                                        targets: chart
                                        running: rect.width === 1000 ? true : false
                                        properties: "opacity"
                                        duration: 2000
                                        from: 0
                                        to: 1
                                    }
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
                        to: rect.height - 130
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: rect
                        running: (_right.state === "Out") ? true : false
                        property: "width"
                        from: rect.width
                        to: rect.width - 400
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
    }

//    "Fichier log sont les fichier
//    qui montre le comportement
//    des BTS par les paramètres
//           spatio-temporels.
//    Ses extensions: *.log, *.txt"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
//        z: -1 // derriere
        id: text_over_blur
        text: "<b>BIENVENUE SUR LA PREVISION DE TRAFIC DU RESEAU 4G</b>"
        color: "#ffffff"
        opacity: 0.9
        font.family: "Helvetica"
        font.pointSize: 25
    }
    Rectangle {
        id: shadow
        visible: false
        width: root.width
        height: root.height
        color: "#80000000"

        ColorAnimation on color {
            running: shadow.visible
            duration: 500
            from: "#00000000"
            to: "#80000000"
        }


    }
    // =============================== user =============================

    User {
        id: user

//        anchors.horizontalCenter: parent.horizontalCenter
//        width: 0.98 * rot.width; height: 0.4 * rot.width
        visible: false
        headerModel: [
            {text: "Noms", width: 1/5},
            {text: "Type", width: 0.5/5},
            {text: "Email", width: 1.5/5},
            {text: "Tel", width: 1/5},
            {text: "Password", width: 1/5},
        ]

        dataModel: Code.fillUser()
        onClicked: print('onClicked', row, JSON.stringify(rowData))
    }

    // =============================== history ==========================
    // =============================== help =============================
    Help {
        id: help
        visible: false
        anchors {horizontalCenter: parent.horizontalCenter}
        y: 10
//        x: -100
        NumberAnimation on opacity {
            running: help.visible
            from: 0
            to: 1
            duration: 400
        }
        NumberAnimation on height{
            running: help.visible
            from: 0
            to: 500
            duration: 500
        }
    }


    Item {
        id: bottom_infos
        visible: true
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
                            text: "fichier P.K.I: *.log, *.txt"
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

                    if (Code.check(fd.file)) {

                        _left.state = "Clicked";
                        _middle.state = "Clicked"
                        item_log.visible = false;
                        item_config.visible = true;
                        var l = bridge.load_from_python(fd.file)
                        list_town = l[1]
                        list_col = l[0]
//                        print(l[1])

                    } else {

                    }
                }
                onRejected: {
                    console.log("Cancelled")
                    _left.state = "OutMouse";
                    _middle.state = "OutMouse";
                    _right.state = "OutMouse";
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
                    visible: true
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
                        text: "<b>Graphiques</b>"
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
                                var t = bridge.predict(fd.file, combo_column.currentText, combo_ville.currentText, input_debut.text);

                                axis = t[0]
                                ord = t[1]
                           }
                        }
                    }
                    NumberAnimation {
                        target: rect
                        running: _right.state === "Clicked" ? true : false
                        property: "height"
                        from: rect.height
                        to: rect.height + 130
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }

                    NumberAnimation {
                        target: rect
                        running:  _right.state === "Clicked" ? true : false
                        property: "width"
                        from: rect.width
                        to: rect.width + 400
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
