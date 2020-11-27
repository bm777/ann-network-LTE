import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.15
import "script.js" as Code

Item { // size controlled by width
    id: root_bareme

// public
    property variant headerModel: [ // widths must add to 1

    ]

    property variant dataModel: [

    ]
    property string st: "create"

    signal clicked(int row, variant rowData);  //onClicked: print('onClicked', row, JSON.stringify(rowData))

// private
    width: root.width * 0.65;  height: 600
    Rectangle {
        color: "white"
        visible: true
        width: root.width
        height: root.height
    }
    Text {
        id: point_text
        text: "FICHE DES EMPLOYES"
        y: - 80
        x: root_bareme.width * 0.3
        color: "#880000ff"
        font.pointSize: root_bareme.width * 0.023
    }



    Rectangle {
        id: header
//        x: root.width * 0.1
        width: parent.width;  height: 50
        color: '#6c5ce7'
//        radius: 0.01 * root_bareme.width

        Rectangle { // half height to cover bottom rounded corners
            width: parent.width;  height: 0.5 * parent.height
            color: parent.color
            anchors.bottom: parent.bottom
        }


        ListView { // header
            anchors.fill: parent
            orientation: ListView.Horizontal
            interactive: false

            model: headerModel

            delegate: Item { // cell
                width: modelData.width * root_bareme.width;  height: header.height

                Text {
                    x: 0.02 * root_bareme.width
                    text: modelData.text
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize:  20 //0.06 * root_bareme.width
                    color: 'white'
                }
            }
        }
    }


    ListView { // data
        anchors{fill: parent;  topMargin: header.height}
        interactive: contentHeight > height
        clip: true
        model: dataModel

        delegate: Item { // row
            width: root_bareme.width;  height: header.height
            opacity: !mouseArea.pressed? 1: 0.3 // pressed state

            property int     row:     index     // outer index
            property variant rowData: modelData // much faster than listView.model[row]

            Row {

                anchors.fill: parent

                Repeater { // index is column
                    model: rowData // headerModel.length

                    delegate: Item { // cell
                        width: headerModel[index].width * root_bareme.width;  height: header.height

                        Text {
                            x: 0.02 * root_bareme.width
//                            x: root.width * 0.11
                            text: modelData
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 20
                        }
                    }
                }
            }

            MouseArea {
                id: mouseArea

                anchors.fill: parent

                onClicked:  {
                    root_bareme.clicked(row, rowData)
                    input_noms.text = rowData[0]
                    combo.currentIndex = rowData[1] == "Admin" ? 0 : 1
                    input_email.text = rowData[2]
                    input_tel.text = rowData[3]
                    input_pass.text = rowData[4]
                    st = "update"
                    confirmer.text = "Mise à jour"

                }
            }
        }

        ScrollBar{}
    }
    Rectangle {
        width: root_bareme.width; height: root_bareme.height
        color: "transparent"
        border.color: "#780000ff"
    }
    Text {
        id: top_text
        x: 950
        y: 70
        font.pointSize: 20
        font.bold: true
        text: st == "create" ? "Créer un compte" : "Mise à jour du compte"
    }
    // ========================noms=================================================
    Text {
        id: text_nom
        text: "Noms"
        font.pointSize: 15
        x: 870
        y: 148
    }
    TextField {
        id: input_noms
        x: 1000
        y: 140
        background: Rectangle {
             implicitWidth: 200
             implicitHeight: 40
             radius: 3
             color: input_noms.enabled ? "transparent" : "#780000ff"
             border.color: input_noms.enabled ? "#780000ff" : "transparent"
        }
    }
    // ========================type=================================================
    Text {
        id: text_type
        text: "Type"
        font.pointSize: 15
        x: 870
        y: 210
    }
    ComboBox {
        id: combo
        x: 1000
        y: 200
        width: 200
        model: ["Admin", "User"]
        visible: true

    }
    // ========================email=================================================
    Text {
        id: text_email
        text: "Email"
        font.pointSize: 15
        x: 870
        y: 270
    }
    TextField {
        id: input_email
        x: 1000
        y: 265
        background: Rectangle {
             implicitWidth: 200
             implicitHeight: 40
             radius: 3
             color: input_email.enabled ? "transparent" : "#780000ff"
             border.color: input_email.enabled ? "#780000ff" : "transparent"
        }
    }
    // ========================tel=================================================
    Text {
        id: text_tel
        text: "Telephone"
        font.pointSize: 15
        x: 870
        y: 340
    }
    TextField {
        id: input_tel
        x: 1000
        y: 336
        background: Rectangle {
             implicitWidth: 200
             implicitHeight: 40
             radius: 3
             color: input_tel.enabled ? "transparent" : "#780000ff"
             border.color: input_tel.enabled ? "#780000ff" : "transparent"
        }
    }
    // ========================password=================================================
    Text {
        id: text_pass
        text: "Mot de passe"
        font.pointSize: 15
        x: 870
        y: 414
    }
    TextField {
        id: input_pass
        x: 1000
        y: 410
        echoMode: TextInput.Password
        background: Rectangle {
             implicitWidth: 200
             implicitHeight: 40
             radius: 3
             color: input_pass.enabled ? "transparent" : "#780000ff"
             border.color: input_pass.enabled ? "#780000ff" : "transparent"
        }
    }
    Button {
        id: confirmer
        text: "Ajouter"
        x: 1090
        y: 500
        contentItem: Text {
            text: confirmer.text
            color: confirmer.down ? "#17a81a" : "2c2c54"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            font.pointSize: 15
        }
        background: Rectangle {
            color: "white"
            border.color: "#780000ff"
            width: parent.width + 10
            height: parent.height
            radius: 4
        }
        onClicked: {
            var db = LocalStorage.openDatabaseSync("ann", "", "Employe management", 1000000);

            if(confirmer.text === "Ajouter") {
                try {
                    db.transaction(function (tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, noms TEXT, type TEXT, email TEXT, tel TEXT, password TEXT)');
                        tx.executeSql('INSERT INTO users (noms, type, email, tel, password) VALUES (?,?,?,?,?)', [input_noms.text, combo.currentText, input_email.text, input_tel.text, input_pass.text]);
                        print("creating element into table user")
                    })
                } catch (err) {
                    console.log("Error creating or insert table in database: " + err)
                };
                user.dataModel = Code.fillUser();
            } // ================
            if(confirmer.text === "Mise à jour") {
                try {
                    db.transaction(function (tx) {
                        tx.executeSql('UPDATE users SET noms=?, type=?, tel=?, password=? WHERE email = ?', [input_noms.text, combo.currentText, input_tel.text, input_pass.text, input_email.text,]);
                    })
                } catch (error_update) {
                    console.log("Error update table in database: " + error_update)
                };
                user.dataModel = Code.fillUser();
                confirmer.text = "Ajouter"
                top_text.text = "Créer un compte"
                print("user:",  Code.fillUser())

            } // ===============
        }

    }
    Rectangle {
        x: root.width - 100
        id: inside
        width: 50
        height: 50
        color: "red"
        border.color: "#80ff0000"
        MouseArea {
            anchors.fill: inside
            onClicked: {
                shadow.visible = false
                user.visible = false
                bottom_infos.visible = true

                root_bareme.visible = false
            }
            onEntered: {
                inside.color = "transparent"
            }
            onExited: {
                inside.color = "#80ff0000"
            }
        }

        Text {
            text: "x"
            font.pointSize: 25
            color: "white"
            anchors.centerIn: parent
        }


    }

    // ============================confirmer=================================================
}
