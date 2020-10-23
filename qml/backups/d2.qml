import QtQuick 2.12
import QtQuick.Window 2.0

Window {

    width: 320
    height: 480
    visible: true

    Item {
        id: root

        width: 320
        height: 480

        Rectangle {
            color: "#272822"
            width: 320
            height: 480
        }


            Rectangle {
                id: rectangle
                x: 40
                y: 20
                width: 120
                height: 200
                color: "red"

                TapHandler {
                    onTapped: {

                        rectangle.width += 10
                        rectangle.x += 10
                    }
                }

            }
    }






    }


