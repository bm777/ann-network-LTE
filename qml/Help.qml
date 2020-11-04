import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 500
    Rectangle {
        id: help
        color: "white"
        width: parent.width
        height: parent.height

        Text {
            y: 10
            font.pointSize: 15
            font.bold: true
            color: "#80000000"
            text: "Aide !"
        }
        Text {
            maximumLineCount: 100
            anchors.fill: parent
            text: "1. Commencer par importer le fichier pki pour lancer les analyse sur le reseaus"
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


