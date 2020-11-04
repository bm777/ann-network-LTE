import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.15

Item {
    id: here_help
    width: 400
    height: 500
    Rectangle {
        id: help
        color: "white"
        width: parent.width
        height: parent.height
        Rectangle {
            width: 30
            height: 30
            anchors.right: parent.right
            color: "#780000ff"
            Text {
                anchors.centerIn: parent
                text: qsTr("X")
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    here_help.visible = false;
                    shadow.visible = false;
                    console.log("exit");
                }
            }
        }

        Text {
            y: 10
            font.pointSize: 15
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#80000000"
            text: "Aide !"
        }
        Text {
            color: "#80000000"
            y: 50
            leftPadding: 20
            text: "1. Commencer par importer le fichier pki pour
    lancer les analyse sur le reseaux. les informations
    celle du réseau LTE(Long Term Evolution), commu-
    némment appelé 4G."
        }

        Text {
            color: "#80000000"
            y: 140
            leftPadding: 20
            text: "2. Puis la partie pré-analyse, est configurer
    de l'analyse. Il y'a deux possibilité: l'une est de
    <prevenir> (les model mathématiques de calcul
    y sont utilisés) et l'autre <consultation>."
        }
        Text {
            color: "#80000000"
            y: 232
            leftPadding: 20
            text: "3. Post-analyse se déclenche au bouton Lancer.
    L'option verbose est activé par defaut, pour
    afficher les processus sur le calcul de la
    probabilité."
        }
        Text {
            color: "#80000000"
            y: 400
            x: 200
            leftPadding: 10
            text: "Version : <b>1.0.0</b>"
        }
        Text {
            color: "#80000000"
            y: 425
            x: 200
            leftPadding: 10
            text: "Licensé : <b>GNU GPLv3</b>"
        }
        Text {
            color: "#80000000"
            y: 450
            x: 200
            leftPadding: 10
            text: "Fait par : <b>Ngando maeva C.</b>" // github.com/bm777
        }
    }
    Item {
        id: message_row
        width: help.width
        height: help.height

        Text {

            y: 250
            anchors.fill: parent
            text: "1. Commencer par importer le fichier pki pour
lancer les analyse sur le reseaux"
        }

    }

    DropShadow {
    anchors.fill: help
    cached: true
    horizontalOffset: 5
    verticalOffset: 5
    radius: 8
    samples: 17
    width: 640
    color: "#80000000"
    source: help
    }


}


